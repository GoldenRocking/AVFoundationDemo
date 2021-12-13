//
//  ViewController.m
//  AVFoundationDemo
//
//  Created by aixuexi on 2021/12/8.
//

#import "ViewController.h"
#import "AVFoundationDemo-Swift.h"

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
    cell.textLabel.text = [self.dataSource[indexPath.row] valueForKey:@"title"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *title = [self.dataSource[indexPath.row] valueForKey:@"vc"];
    Class className = NSClassFromString(title);
    
    if(className){
        UIViewController *vc = [[className alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else
    {
        
        //在 OC 中调用 NSClassFromString() 方法获取 Swift 语言写的类，需要用在类名前加上工程名（个人认为应该是 Target 名）和路径连接符 “.”
        //swift 调用OC 也一样
        
        title = [@"AVFoundationDemo." stringByAppendingString:title];
        Class className = NSClassFromString(title);
        UIViewController *vc = [[className alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


#pragma lazy data

-(NSArray *)dataSource{
    if(!_dataSource){
        
        _dataSource = @[
            @{@"title" : @"1. 基础-AV Foundation 入门", @"vc" : @"AVSpeechController"},
            @{@"title" : @"2. 基础-播放和录制音频", @"vc" : @"AVPlayRecord"},
            @{@"title" : @"3. 基础-资源和元数据", @"vc" : @""},
            @{@"title" : @"4. 基础-视频播放", @"vc" : @""},
            @{@"title" : @"5. 基础-AV Kit用法", @"vc" : @""},
            @{@"title" : @"6. 媒体-捕捉媒体", @"vc" : @""},
            @{@"title" : @"7. 媒体-高级捕捉功能", @"vc" : @""},
            @{@"title" : @"8. 媒体-读取和写入媒体", @"vc" : @""},
            @{@"title" : @"9. 媒体创建和编辑-媒体的组合和编辑", @"vc" : @""},
            @{@"title" : @"10. 媒体创建和编辑-混合音频", @"vc" : @""},
            @{@"title" : @"11. 媒体创建和编辑-创建视频过度效果", @"vc" : @""},
            @{@"title" : @"12. 媒体创建和编辑-动画图层内容", @"vc" : @""}
        ];
        
    }
    return _dataSource;
}


@end



