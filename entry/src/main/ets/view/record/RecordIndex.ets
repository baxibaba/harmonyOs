import SearchHeader from './SearchHeader'

@Component
export default struct RecordIndex {
  build() {
    Column() {
      //   头部
      SearchHeader()
      //   卡片
      Text("卡片")
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