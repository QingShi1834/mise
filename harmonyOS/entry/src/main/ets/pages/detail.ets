// @ts-nocheck
import {NewsData} from '../model/NewsData'
import router from '@system.router';
import {getNewsDatas} from '../model/NewsDataModel'
import {getDefaultData} from '../model/NewsDataModel'
import {findDate} from '../model/NewsDataModel'
import featureAbility from '@ohos.ability.featureAbility';

//var msg:String = router.getParams().msg

@Entry
@Component
struct detail {
  @State message: string = 'Hello World'
  // @Provide newsData: NewsData = getDefaultData()
  private newsData: NewsData = getDefaultData()
  // private newsItems: NewsData[] = getNewsDatas()

  aboutToAppear(){
    if (router.getParams()) {
      this.newsData = router.getParams().newsItem
    }

  }

  build() {
    Column(){
      Button() {
        Image($rawfile('back.png')).width(30).height(30)
      }.margin({right:280,top:20}).onClick(()=>{
        router.back()
      })
      Scroll(){
        Column() {
          Text(this.newsData.title)
            .fontSize(25)
            .margin({ right: 20, left: 20, top: 10, bottom: 10 })
          Text("reads:" + this.newsData.reads + "  likes:" + this.newsData.likes)
            .fontSize(16)
            .margin({ right: 20, left: 20, bottom: 10 })
          Image(this.newsData.imgUrl).width("90%").height(180)
            .margin({ left: 20, right: 20, bottom: 15 })
          Text(this.newsData.content).fontSize(18).margin({ left: 20, right: 20 })
        }.alignItems(HorizontalAlign.Start)
      }.flexGrow(1).width("100%").height("%90")

      NewsBottom()
    }
    .height("100%").width("100%")

  }

}

@Component
struct NewsBottom {
  // 设备管理对象
  // private deviceMag: any= null

  build() {
    Column() {
      Divider()
        .vertical(false)
        .color("#c1bdc1")
        .strokeWidth(1)
        .height(1)
        .width('100%')
        .margin({ bottom: 5 })

      Row() {
        Button("Enter a comment.       ").fontSize(15)
          .margin({ left: 20, right: 20 }).backgroundColor("#dbd8db").fontColor("#4b494b")
        Image($rawfile('icon_message.png')).width(25).height(21).margin({ right: 10 })
        Image($rawfile('icon_star.png')).width(25).height(21).margin({ right: 10 })
        Image($rawfile('icon_good.png')).width(25).height(21).margin({ right: 10 })
        Image($rawfile('icon_share.png')).width(25).height(21).margin({ right: 10 })
      }
      .margin({ bottom: 5 }).height(40).width("100%")
    }
  }


}
