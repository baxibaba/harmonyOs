import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import DatePickDialog from './DatePickDialog'

@Component
export default struct StatsCard {
  @StorageProp('selectedDate') selectedDate: number = DateUtil.beginTimeOfDay(new Date())
  controller:CustomDialogController = new CustomDialogController({
    builder:DatePickDialog({ selectedDate: new Date(this.selectedDate) })
  })
  build() {

    Column(){
      Row(){
        Text(DateUtil.formatDate(this.selectedDate))
          .fontColor($r('app.color.secondary_color'))
        Image($r('app.media.ic_public_spinner'))
          .width(20)
          .fillColor($r('app.color.secondary_color'))
      }
      .padding(CommonConstants.THOUSANDTH_12)
      .onClick(()=>{
        console.log("----",DateUtil.formatDate(this.selectedDate))
        this.controller.open()
      })
    }
    .width(CommonConstants.THOUSANDTH_940)
    .backgroundColor($r('app.color.stats_title_bgc'))
    .borderRadius(CommonConstants.DEFAULT_18)
    .alignItems(HorizontalAlign.Start)
  }
}