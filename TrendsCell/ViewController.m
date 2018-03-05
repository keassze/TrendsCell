//
//  ViewController.m
//  TrendsCell
//
//  Created by 何松泽 on 2018/3/5.
//  Copyright © 2018年 何松泽. All rights reserved.
//

#import "ViewController.h"
#import "SZUtils.h"
#import "SZTrendsCell.h"
#import "SZDataModel.h"

static CGFloat kScreenWidth;
static CGFloat kScreenHeight;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataArrs;
@property (nonatomic, strong)NSArray *heightArrs;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    kScreenWidth  = [UIScreen mainScreen].bounds.size.width;
    kScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    NSArray *randomArr = [[NSArray alloc] initWithObjects:
                          @"考生因身高遭淘汰北京体育大学艺考现场,一名考生因身高不够遭淘汰,提前走出考场,家长们立即蜂拥而上。她还现场表演了本来为复试准备的舞蹈,现场一片叫好",
                          @"在线音乐市场吸引国内不少大佬相继布局的同时，也有运营多年的平台黯然退出，被称为“音乐第一股”的多米音乐就是其中一个。智能音响品牌Sonos日前向用户发送邮件表示，多米音乐计划终止相关业务运营。尽管截至目前多米音乐还未对此事正面发声，但北京商报记者观察到，多米音乐现已连续多年出现亏损，用户量也不断减少，虽然曾试图转型并布局粉丝经济、音乐演出，但从此次计划终止运营来看，这也未能拯救多米音乐。无限期停止音乐服务Sonos在给用户发送的邮件中提及，“受市场因素影响，多米音乐公司计划终止多米相关业务运营，服务器将于2018年2月28日下架，无限期停止音乐服务，同时将导致您在Sonos平台上无法继续使用多米音乐”。北京商报记者观察发现，多米音乐计划停止运营似乎在此前就已经有所预兆。不仅曾保持每周更新约5条消息的多米音乐官方微博，在2月9日中午发布一条视频后，至今已有近一个月未再更新其他消息，除此以外，在今年春节前夕，即2月14日，在新三板挂牌一年多的多米音乐发布公告称，申请在新三板终止挂牌。",
                          @"翠鸟的德语名字是“Eisvogel”,字面意思就是“冰鸟”", nil];
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    for (int index = 0; index < 10; index++) { //随机取十条数据
        SZDataModel *model = [[SZDataModel alloc] init];
        model.content = randomArr[random()%3];
        [tempArr addObject:model];
    }
    self.dataArrs = [tempArr copy];
    //获取cell所对应的高度数组
    self.heightArrs = [[SZUtils shareUtils] getHeightArrayWithDatas:_dataArrs labelWidth:SZLabelWidth];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = (id)self;
    self.tableView.dataSource = (id)self;
    [self.view addSubview:self.tableView];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SZTrendsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellNib_SZTrendsCell];
    if (!cell) {
        cell = [[SZTrendsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellNib_SZTrendsCell];
    }
    [cell setCellWithModel:(SZDataModel *)_dataArrs[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger cellNum = _dataArrs ? _dataArrs.count:0;
    return cellNum;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = _heightArrs ? [_heightArrs[indexPath.row] floatValue]:12.f;
    return height + 10; //+10 边距
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
