## 1.转ZTLetterIndex(Mar 31 提交的版本，有2个细节问题)
<br>
https://github.com/JoviZT/Z
<br>
1.优点：实现了点击后 索引 的变化，上下滑动 索引 也有 对应变化
   <br>
   缺点：1.无数据 时候 时候 初始化 数据的判定
      <br>
        2.数据量过少，点击对应 索引 ，需要点击多次才可选中。
      <br>
      <img src="https://github.com/KongXiangX/UITableView_Index-UITableView--/blob/master/22gif.gif" width=345 height=594/>
      
      
## 2.转 LGIndexView
<br>
https://github.com/LiuGanQQQ/LGIndexView
<br>
1.优点： 动画 很好
<br>
   缺点：未实现  上下滑动的时候的后  索引变化
<br>
<img src="https://github.com/KongXiangX/UITableView_Index-UITableView--/blob/master/11.gif" width=345 height=594 />

细节更正
<br>
1.无数据 初始化后 问题
<br>
<img src="https://github.com/KongXiangX/UITableView_Index-UITableView--/blob/master/11.png" width=846 height=572  />

2.数据过少，索引需要多次点击问题，滑动监听方法 与 第三方 对应点击方法 循环问题引起的。
<br>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
<br>
- (void)ZTLetterIndex:(ZTLetterIndex *)indexView didSelectedItemWithIndex:(NSInteger)index;
<br>
<img src="https://github.com/KongXiangX/UITableView_Index-UITableView--/blob/master/22.png" width=900 height=823 />
<br>
## 3.系统-- 方法
<br>
1.缺点：
<br>
1. 在模拟器上 测试 点击 A与 B 时，需要靠上点击，否则 点击一直 为A
<br>
2.点击后没有 字母变化的显示，系统方法只实现了 所以整体背景点击后的变化方法。
<br>
  //1.2 点击索引 整体 背景颜色
  <br>
   indexTable.sectionIndexTrackingBackgroundColor = [UIColor purpleColor];
   <img src="https://github.com/KongXiangX/UITableView_Index-UITableView--/blob/master/33.gif" width=345 height=594 />
