//
//  ViewController.m
//  KtTableView
//
//  Created by baidu on 16/4/13.
//  Copyright © 2016年 zxy. All rights reserved.
//

#import "KTMainViewController.h"
#import "KtMainTableViewCell.h"
#import "KtMainTableViewDataSource.h"

#import "AFNetworking.h"
#import "KtTableViewBaseItem.h"
#import "KtMainTableModel.h"

#import "MJRefresh.h"

@interface KTMainViewController ()<KtBaseListModelProtocol>

//@property (strong, nonatomic) KtMainTableModel *model;

@end

@implementation KTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createModel];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)createModel {
    self.listModel = [[KtMainTableModel alloc] initWithAddress:@"/mooclist.php"];
    self.listModel.delegate = self;
}

- (void)createDataSource {
    self.dataSource = [[KtMainTableViewDataSource alloc] init]; // 这一步创建了数据源
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshRequestDidSuccess {
    [super refreshRequestDidSuccess];
    for (KtMainTableBookItem *book in ((KtMainTableModel *)self.listModel).tableViewItem.books) {
        KtTableViewBaseItem *item = [[KtTableViewBaseItem alloc] init];
        item.itemTitle = book.bookTitle;
        [self.dataSource appendItem:item];
    }
}

- (void)loadRequestDidSuccess {
    [super loadRequestDidSuccess];
    for (KtMainTableBookItem *book in ((KtMainTableModel *)self.listModel).tableViewItem.books) {
        KtTableViewBaseItem *item = [[KtTableViewBaseItem alloc] init];
        item.itemTitle = book.bookTitle;
        [self.dataSource appendItem:item];
    }
    
}

@end
