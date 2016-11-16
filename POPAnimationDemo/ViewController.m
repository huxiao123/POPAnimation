//
//  ViewController.m
//  POPAnimationDemo
//
//  Created by 胡啸－ Mac on 16/11/16.
//  Copyright © 2016年 gzsc-hx. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "GCD.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSouce;
@property (nonatomic,getter=onLoadData)BOOL isLoadData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    [self setUI];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSArray *)dataSouce{
    if (!_dataSouce) {
        _dataSouce = [NSMutableArray array];
        for (NSInteger i=0; i<40; i++) {
            NSArray *array = @[@"pop动画Demo",@"popanimation"];
            [_dataSouce addObject:array];
        }
    }
    return _dataSouce;
}

/*
 设置延迟动画
 */
- (void)setUI{
    [GCDQueue executeInMainQueue:^{
        NSMutableArray *indexpathArray = [NSMutableArray array];
        for (NSInteger i=0; i<self.dataSouce.count; i++) {
            NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];
            [indexpathArray addObject:indexpath];
        }
        self.isLoadData = YES;
        [self.tableView insertRowsAtIndexPaths:indexpathArray withRowAnimation:UITableViewRowAnimationFade];
    }afterDelaySecs:0.18f];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return   self.isLoadData ? self.dataSouce.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.title = self.dataSouce[indexPath.row][0];
    cell.subTitle = self.dataSouce[indexPath.row][1];
    cell.index = indexPath.row;
    [cell createAttributedString];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
