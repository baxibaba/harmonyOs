import { CommonConstants } from '../../common/constants/CommonConstants'

@CustomDialog
export default struct DatePickDialog {
  controller: CustomDialogController
  selectedDate: Date = new Date()

  build() {

    Column() {
      //   日期选择器
      DatePicker({
        start: new Date('2022-01-01'),
        end: new Date(),
        selected: this.selectedDate
      })
        // .onChange((date) => {
        //   this.selectedDate.setFullYear(date.year, date.month, date.day)
        // })
        .onDateChange((value: Date) => {
          this.selectedDate = value
          //   this.selectedDate.setFullYear(value.year, value.month, value.day)
          console.info('select current date is: ' + value.toString())
        })

      //   按钮
      Row({space:CommonConstants.SPACE_12}){
        Button('取消')
          .width(120)
          .backgroundColor($r('app.color.light_gray'))
          .onClick(()=>this.controller.close())
        Button('确定')
          .width(120)
          .backgroundColor($r('app.color.primary_color'))
          .onClick(()=>{
          //   保存全局
            AppStorage.setOrCreate('selected',this.selectedDate.getTime())
            console.log("this.selectedDate.getTime()",this.selectedDate.getTime())
          //   关闭窗口
            this.controller.close()
          })
      }
    }
    .padding(CommonConstants.SPACE_12)
  }
}