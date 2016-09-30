//
//  ViewController.m
//  ShoppingCartAnimation
//
//  Created by IKT on 16/9/30.
//  Copyright © 2016年 www.tuanmob.com. All rights reserved.
//

#import "ViewController.h"
#import "ParabolaView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableIVew;
@property (nonatomic, strong) NSArray *data;

@end

@implementation ViewController{
    CGPoint _endP;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableIVew = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-50)];
    [_tableIVew setDataSource:self];
    [_tableIVew setDelegate:self];
    [_tableIVew registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:_tableIVew];
    
    UIView *cart = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50, 50, 50)];
    [cart setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:cart];
    _endP = CGPointMake(cart.center.x, cart.frame.origin.y);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    [cell.textLabel setText:@"商品"];
    UIButton *add = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-50, 15, 30, 30)];
    [add.layer setCornerRadius:15];
    [add.layer setMasksToBounds:YES];
    [add setBackgroundColor:[UIColor redColor]];
    [cell addSubview:add];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [add addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)addAction:(UIButton *)add{
    
    CGRect frame = [add convertRect:self.view.bounds toView:nil];
    CGPoint startP = CGPointMake(frame.origin.x+add.frame.size.width/2.0, frame.origin.y+add.frame.size.height/2.0);
    [[ParabolaView new] UsingFrame:add.frame startPoint:startP endPoint:_endP During:.6 Finish:^{
        NSLog(@"抛物线动画结束");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
