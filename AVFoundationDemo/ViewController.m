//
//  ViewController.m
//  AVFoundationDemo
//
//  Created by aixuexi on 2021/12/8.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"AVFoundation 学习";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    if(@available(iOS 15.0, *)){
        tableView.sectionHeaderTopPadding = 0;
    }
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.bottom.mas_equalTo(0);
    }];
}


#pragma tableView delegate

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *identifily = @"cellAVFoundation";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifily];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifily];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma lazy data

-(NSArray *)dataSource{
    if(!_dataSource){
        
        _dataSource = @[
            @"1. 基础-AV Foundation 入门",
            @"2. 基础-播放和录制音频",
            @"3. 基础-资源和元数据",
            @"4. 基础-视频播放",
            @"5. 基础-AV Kit用法",
            @"6. 媒体-捕捉媒体",
            @"7. 媒体-高级捕捉功能",
            @"8. 媒体-读取和写入媒体",
            @"9. 媒体创建和编辑-媒体的组合和编辑",
            @"10. 媒体创建和编辑-混合音频",
            @"11. 媒体创建和编辑-创建视频过度效果",
            @"12. 媒体创建和编辑-动画图层内容"
        ];
        
    }
    return _dataSource;
}


@end



