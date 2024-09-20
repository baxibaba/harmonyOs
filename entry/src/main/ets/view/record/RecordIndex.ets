import SearchHeader from './SearchHeader'
import StatsCard from './StatsCard'

@Component
export default struct RecordIndex {
  build() {
    Column() {
      //   头部
      SearchHeader()
      //   卡片
      StatsCard()
      //   记录列表
      Text("记录")


    }
    .height('100%')
    .width('100%')
    // .alignItems(HorizontalAlign.End)
    // .justifyContent(FlexAlign.Start)
    .backgroundColor($r('app.color.index_page_background'))
  }
}