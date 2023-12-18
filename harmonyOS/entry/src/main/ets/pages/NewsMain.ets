import {NewsData} from '../model/NewsData'
import {getDefaultData, getNewsItem} from '../model/NewsDataModel'
import {getNewsDatas} from '../model/NewsDataModel'
import router from '@system.router'
import { add } from '../../cpp/types/libentry'


@Entry
@Component
struct NewsMain {
  build() {
    Column() {
      NewsTypeComponent()
    }
  }
}

/**
* 主页顶部类型新闻组件
*/
@Component
struct NewsTypeComponent {
  private newsItems: NewsData[] = getNewsDatas()
  @Provide newsData: NewsData= this.newsItems[0]
  private sun_url : string = 'air_sun.png'
  // private moon_url : string = 'moon.png'
  // private transformer : Boolean = true
  build() {

    Column() {
      Row(){
        Image($rawfile(this.sun_url)).width(35).margin({ right: 15 })
        // .onTouch(()=>{
        //   if (this.transformer) {
        //     this.transformer = false
        //   }else {
        //     this.transformer = true
        //   }
        // })
        Column(){
          Text("CaptureEyes")
            .fontSize(25)
            .margin({ right: 60, left: 20, top: 20, bottom: 10 })
            .borderRadius(24)
          Row() {


            TextInput({ placeholder: 'search...' })
              .width("70%")
              .height(40)
              .backgroundColor('#ffe2e1e1').borderRadius(24)

            Image($rawfile('search.svg')).width(25).height(21).margin({ left : 15 })

          }.margin({top : 10})
        }
      }

        Divider()
          .vertical(false)
          .color("#c1bdc1")
          .strokeWidth(1)
          .height(1)
          .width('100%')
          .margin({ bottom: 5,top : 10 })

      // .backgroundImage($rawfile('rainbow.png'))
      // .backgroundImageSize({width : 300,height : 150}).backgroundImagePosition({x:90,y:-40})

      Tabs() {
        TabContent() {
          // NewsListAdvertisement()
          NewsListPage({ newsItems: this.newsItems })
        }.tabBar('All')

        TabContent() {
          NewsListPage({ newsItems: this.newsItems.filter(item => (item.newsType == 'Health')) })
        }.tabBar('Health')

        TabContent() {
          NewsListPage({ newsItems: this.newsItems.filter(item => (item.newsType == 'Finance')) })
        }.tabBar('Finance')

        TabContent() {
          NewsListPage({ newsItems: this.newsItems.filter(item => (item.newsType == 'Technology')) })
        }.tabBar('Technology')

        TabContent() {
          NewsListPage({ newsItems: this.newsItems.filter(item => (item.newsType == 'Sport')) })
        }.tabBar('Sport')

        TabContent() {
          NewsListPage({ newsItems: this.newsItems.filter(item => (item.newsType == 'Internet')) })
        }.tabBar('Internet')

        TabContent() {
          NewsListPage({ newsItems: this.newsItems.filter(item => (item.newsType == 'Game')) })
        }.tabBar('Game')
      }
      .barWidth(310)
      .barHeight(50)
      .barMode(BarMode.Scrollable)
      .backgroundColor('#ffffffff')

    }
  }
}


/**
 * 主页新闻推荐列表
 */
@Component
struct NewsListAdvertisement {
  // private newsItems : NewsData[] = getNewsDatas()
  private swiperController: SwiperController = new SwiperController()
  build(){
    Swiper(this.swiperController) {
      // Text("0")
      Image($rawfile('news_image15.jpg'))
        .width(240)
        .height(100)
        .margin({left:10,right:10})


      // .backgroundColor(Color.Gray)
      // .textAlign(TextAlign.Center)
      // .fontSize(30)
      // Text("1")

      Image($rawfile('news_image16.jpg'))
        .width(240)
        .height(100)
        .margin({left:10,right:10})

      // .backgroundColor(Color.Green)
      // .textAlign(TextAlign.Center)
      // .fontSize(30)
      // Text("2")

      Image($rawfile('news_image17.jpg'))
        .width(240)
        .height(100)
        .margin({left:10,right:10})



      // .backgroundColor(Color.Pink)
      // .textAlign(TextAlign.Center)
      // .fontSize(30)

      Image($rawfile('news_image18.jpg'))
        .width(240)
        .height(100)
        .margin({left:10,right:10})

      // .backgroundColor(Color.Blue)
      // .textAlign(TextAlign.Center)
      // .fontSize(30)
    }
    .indicator(true)
    // .vertical(true)
    .displayCount(2)
    .loop(true)
    .autoPlay(true)
    .interval(10000)
  }
}

@Component
struct NewsHot {

  // private title : String = "Latest technology and industry weather vane"
  private newsItems : NewsData[] =  getNewsDatas()
  // private nums : number[] = {1,2,3}

  build(){
    Column(){
      List() {
        ForEach(this.newsItems.slice(0,4), item => {
          // HotNewsListItem(){
            ListItem(){
              HotNewsListItem({newsItem : item})
          }
        }, item => item.newsId.toString())
      }


      // Row() {
      //   Text("2").fontSize(14).fontColor(Color.Red).margin({ left: 10, right: 10 })
      //   Text("我是热搜词条2 我是热搜词条2 我是热搜词条2 我是热搜词条2 我是热搜词条2")
      //     .fontSize(12)
      //     .fontColor(Color.Blue)
      //     .fontWeight(300)
      //     .constraintSize({ maxWidth: 200 })
      //     .maxLines(1)
      //     .textOverflow({ overflow: TextOverflow.Ellipsis })
      //   Text("热")
      //     .margin({ left: 6 })
      //     .textAlign(TextAlign.Center)
      //     .fontSize(10)
      //     .fontColor(Color.White)
      //     .fontWeight(600)
      //     .backgroundColor(0xCC5500)
      //     .borderRadius(5)
      //     .width(15)
      //     .height(14)
      // }.width('100%').margin(5)
      //
      // Row() {
      //   Text("3").fontSize(14).fontColor(Color.Orange).margin({ left: 10, right: 10 })
      //   Text("我是热搜词条3")
      //     .fontSize(12)
      //     .fontColor(Color.Blue)
      //     .fontWeight(300)
      //     .maxLines(1)
      //     .constraintSize({ maxWidth: 200 })
      //     .textOverflow({ overflow: TextOverflow.Ellipsis })
      //   Text("热")
      //     .margin({ left: 6 })
      //     .textAlign(TextAlign.Center)
      //     .fontSize(10)
      //     .fontColor(Color.White)
      //     .fontWeight(600)
      //     .backgroundColor(0xCC5500)
      //     .borderRadius(5)
      //     .width(15)
      //     .height(14)
      // }.width('100%').margin(5)
      //
      // Row() {
      //   Text("4").fontSize(14).fontColor(Color.Grey).margin({ left: 10, right: 10 })
      //   Text("我是热搜词条4 我是热搜词条4 我是热搜词条4 我是热搜词条4 我是热搜词条4")
      //     .fontSize(12)
      //     .fontColor(Color.Blue)
      //     .fontWeight(300)
      //     .constraintSize({ maxWidth: 200 })
      //     .maxLines(1)
      //     .textOverflow({ overflow: TextOverflow.Ellipsis })
      // }.width('100%').margin(5)
    }

  }
}




/**
 * 主页新闻列表组件
 */
@Component
struct NewsListPage {
  private newsItems: NewsData[]

  build() {
    Column() {
      NewsHot()
      NewsListAdvertisement()
      List() {
        ForEach(this.newsItems, item => {
          ListItem() {
            NewsListItem({ newsItem: item })
          }
        }, item => item.newsId.toString())
      }
      .width("90%")
      .margin({ bottom: 220 })
      .scrollBar(BarState.Auto)
      .divider({
          strokeWidth: 1,
          startMargin: 60,
          endMargin: 10,
          color: '#ffe9f0f0'
        })
    }
  }
}

/**
 * 新闻列表条目组件
 */
@Component
struct NewsListItem {
  private newsItem: NewsData
  @Consume newsData: NewsData;
  @Provide newsID: String = this.newsData.newsId
  build() {
    Column() {
      Row() {

        Image(this.newsItem.imgUrl).width("35%").height(80).margin(10).borderRadius(24)
        Column(){
          Text(this.newsItem.title)
            .fontSize(17)
            .width("55%")
            .height(60)
            .maxLines(3)
            .margin(10)
            .borderRadius(24)
          Row(){
            Image($rawfile('hot.png')).width(10).height(10).margin({ right: 1,bottom : 20 })
            Text("热门").fontColor('#ffc8243b').fontSize(10).margin({bottom : 20,right:70})
            Image($rawfile('thumb.png')).width(12).height(12).margin({ right: 1,bottom : 20 })
            Text(this.newsItem.likes).fontSize(10).margin({bottom:20})
          }

          //Text("reads:" + this.newsData.reads + "  likes:" + this.newsData.likes)
        }

      }

      Divider()
        .vertical(false)
        .color("#fff6f4f6")
        .strokeWidth(5)
    }
    .height(101)
    .width("100%")
    .backgroundColor("#fffdfbfb")
    .onClick(() => {
      {
        // 如果为竖屏则跳转到详情页

        router.push(
          {
            // 跳转到指定页面

            uri: 'pages/detail',
            params:{
              newsItem: this.newsItem
            }
          })
      }
    })
  }
}

/**
 * 新闻列表条目组件
 */
@Component
struct HotNewsListItem {
  private newsItem : NewsData = getDefaultData()
  // @Consume newsData: NewsData;
  // private  newsID: String
  build(){
    Row() {
      Text(this.newsItem.newsId).fontSize(14)
        .fontColor((this.newsItem.newsId == '1')?Color.Red:(this.newsItem.newsId == '2')?Color.Red:(this.newsItem.newsId == '3')?Color.Orange:Color.Brown)
        .margin({ left: 10, right: 10 })
      Text(this.newsItem.title)
        .fontSize(12)
        .fontColor(Color.Blue)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .fontWeight(300)
      Text("爆")
        .margin({ left: 6 })
        .textAlign(TextAlign.Center)
        .fontSize(10)
        .fontColor(Color.White)
        .fontWeight(600)
        .backgroundColor(0x770100)
        .borderRadius(5)
        .width(15)
        .height(14)
    }.width('100%').margin(5)
    .onClick(()=>{
      {
        // 如果为竖屏则跳转到详情页

        router.push(
          {
            // 跳转到指定页面

            uri: 'pages/detail',
            params:{
              newsItem: this.newsItem
            }
          })
      }
    })
    .width('100%').margin(5)
  }


}