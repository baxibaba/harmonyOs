import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct SearchHeader {
  build() {
    Row({ space: CommonConstants.SPACE_2 }) {
      Search({ placeholder: '搜索.....' })
        .textFont({ size: 18 })
        .layoutWeight(1)
      Badge({ count: 1, position: BadgePosition.RightTop, style: { fontSize: 12 } }) {
        Image($r('app.media.ic_public_email'))
          .width(24)
      }

    }
    .width(CommonConstants.THOUSANDTH_940)

  }
}