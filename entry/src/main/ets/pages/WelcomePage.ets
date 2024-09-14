import UserPrivacyDialog from '../view/welcome/UserPrivacyDialog';
import common from '@ohos.app.ability.common';
import PreferenceUtil from '../common/utils/PreferenceUtil'
import { router } from '@kit.ArkUI';

@Extend(Text)
function opacityWhiteText(fontSize: number = 10, opacity: number) {
  .fontSize(fontSize)
  .opacity(opacity)
  .fontColor(Color.White)
}

const PREf_KEY = 'userPrivacyKey'

@Entry
@Component
struct WelcomePage {
  context = getContext(this) as common.UIAbilityContext
  controller: CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog({
      confirm: (): void => this.onConfirm(),
      cancel: (): void => this.exitApp()
    })
  })

  async aboutToAppear() {
    let isAgree = await PreferenceUtil.getPreferenceValue(PREf_KEY, false)
    if (isAgree) {
      this.jumpToIndex()
    } else {
      this.controller.open()

    }
  }

  jumpToIndex() {

    setTimeout(() => {
      router.replaceUrl({
        url: 'pages/Index'
      })
    }, 2000)
  }

  onConfirm() {
    PreferenceUtil.putPreferenceValue(PREf_KEY, true)
    this.jumpToIndex()
  }

  exitApp() {
    console.log("1111111")
    this.context.terminateSelf()
  }

  @State message: string = 'Hello World';

  build() {
    Column({ space: 5 }) {
      // 1图片
      Row() {
        Image($r('app.media.home_slogan'))
          .width(260)
      }
      .layoutWeight(1)

      //   2图片
      Image($r('app.media.home_logo'))
        .width(150)
      //   文字
      Row() {
        Text('黑马健康支持').opacityWhiteText(12, 0.8)
        Text('IPV6').opacityWhiteText(10, 0.8)
          .border({
            style: BorderStyle.Solid,
            width: 1,
            color: Color.White,
            radius: 15
          })
          .padding({ left: 5, right: 5 })
          .margin({ left: 5, right: 5 })
        Text('网络').opacityWhiteText(10, 0.8)
      }

      Text('我支持你我支持你我支持你我支持你我支持你我支持你').opacityWhiteText(12, 0.8)
      Text('你支持我').opacityWhiteText(12, 0.8)
        .margin({ bottom: 35 })
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.welcome_page_background'))
  }
}