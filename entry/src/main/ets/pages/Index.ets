import router from '@ohos.router';
import { InFoComponent } from '../comments/homePages/InFoComponent'

interface tabsType {
  name: string,
  selectedImg: Resource,
  normalImg: Resource
}

@Entry
@Component
struct Index {
  private tabsController: TabsController = new TabsController()
  private tabBarList: Array<tabsType> = [
    {
      name: '微信',
      selectedImg: $r('app.media.icon'),
      normalImg: $r('app.media.icon'),
    },
    {
      name: '通讯录',
      selectedImg: $r('app.media.icon'),
      normalImg: $r('app.media.icon'),
    },
    {
      name: '发现',
      selectedImg: $r('app.media.icon'),
      normalImg: $r('app.media.icon'),
    },
    {
      name: '我的',
      selectedImg: $r('app.media.icon'),
      normalImg: $r('app.media.icon'),
    }
  ]
  @State currentIndex: number = 0;
  // 自定义导航栏
  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      // 跳转至指定索引值对应的TabContent内容
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Column() {
      // Column() {
      //   Text('标题')
      //     .height(50)
      //     .fontSize(22)
      // }

      Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
        ForEach(this.tabBarList, (item: tabsType, index: number) => {
          TabContent() {
            InFoComponent({ name: item.name ! })
          }
          .tabBar(this.TabBuilder(item.name, index, item.selectedImg, item.normalImg))
        }, (item: tabsType) => item.name)
      }
      .scrollable(false)
    }
  }
}