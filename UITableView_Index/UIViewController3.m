//
//  UIViewController3.m
//  UITableView_Index
//
//  Created by apple on 2017/11/3.
//  Copyright © 2017年 KX. All rights reserved.
//

#import "UIViewController3.h"
#import "NSString+PinYin.h"
#import "LGUIView.h"

#define KXScreenW [UIScreen mainScreen].bounds.size.width
#define KXScreenH [UIScreen mainScreen].bounds.size.height

@interface UIViewController3 ()<UITableViewDelegate,UITableViewDataSource>
{
    LGUIView * lgView;
}
@property (nonatomic, strong) UITableView * indexTable;
@property (nonatomic, strong) NSMutableArray * indexArr;  //索引数组
@property (nonatomic, strong) NSMutableArray * dataArr;   //表中内容


@end

@implementation UIViewController3

- (void)viewDidLoad {
    [super viewDidLoad];

    //0.索引-- 系统
    self.title = @"索引-自定义方法二";

    //1.初始化
    [self setupTable];

    //2.数据
    [self initDataSource];

}

#pragma mark -1. 初始化
- (void)setupTable
{
    UITableView * indexTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KXScreenW, KXScreenH) style:UITableViewStylePlain];
    indexTable.dataSource = self;
    indexTable.delegate = self;
    indexTable.showsVerticalScrollIndicator = NO;
    indexTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:indexTable];
    self.indexTable = indexTable;
}


#pragma mark -2. 数据
- (void)initDataSource
{
    
    //0.原始 错乱数据
    NSArray *array = @[@"登记", @"大奔", @"周傅", @"爱德华",@"((((", @"啦文琪羊", @"   s文强", @"过段时间", @"等等", @"各个", @"宵夜**", @"***", @"贝尔",@"*而结婚*", @"返回***", @"你还", @"与非门*", @"是的", @"*模块*", @"*没做*",@"俄文", @"   *#咳嗽", @"6",@"fh",@"C罗",@"邓肯",@"dsf",@"n懂第三方",@"fwei"];
    
    
    NSArray * arr = @[@"新朋友",@"群聊",@"标签",@"公众号"];
    NSDictionary * firstDic = @{@"content" : arr ,
                                @"firstLetter" : @"🔍"
                                };
    
    
    //1.索引数据
    [self.indexArr addObject:firstDic[@"firstLetter"]];
    //排序 返回 a-z 排序的字典组成的数组
    NSArray * indexArray= [array arrayWithPinYinFirstLetterFormat];
    for (int i = 0; i < indexArray.count; i++) {
        NSDictionary * dic = indexArray[i];
        NSString * tem  = dic[@"firstLetter"];
        //获取所有 首字母
        [self.indexArr addObject:tem];
    }
    
    
    //2.所有数据
    [self.dataArr  addObject:firstDic];
    [self.dataArr addObjectsFromArray:indexArray];
    
    //3.自定义 索引 列表
    lgView = [[LGUIView alloc]initWithFrame:CGRectMake(KXScreenW - 40, 100, 40, KXScreenH - 140) indexArray:self.indexArr];
    [self.view addSubview:lgView];
    
    [lgView selectIndexBlock:^(NSInteger section)
     {
         [self.indexTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]
                                 animated:NO
                           scrollPosition:UITableViewScrollPositionTop];
     }];
}


#pragma mark -- 2.1 UITableViewDelegate
//返回section的个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArr.count;
}
//返回每个section header 的标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        
        return @"";
    }else{
        return [self.indexArr objectAtIndex:section];
    }
}
//返回section中的row
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSDictionary * dic = self.dataArr[section];
    NSArray * arr = dic[@"content"];
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Identify = @"CELL";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identify];
    }
    NSDictionary * dic = self.dataArr[indexPath.section];
    NSArray * arr = dic[@"content"];
    cell.textLabel.text = arr[indexPath.row];
    return cell;
}


#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{    
    
}


#pragma mark - 懒加载
//索引 数组
- (NSMutableArray *)indexArr
{
    if (!_indexArr) {
        _indexArr = [NSMutableArray arrayWithCapacity:1];
    }
    return _indexArr;
}

//所有 数据
- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
