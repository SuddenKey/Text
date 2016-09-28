//
//  LocalMusicViewController.m
//  Text
//
//  Created by HaoHao on 16/9/27.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import "LocalMusicViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface LocalMusicViewController ()

@end

@implementation LocalMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self QueryAllMusic];
}

- (void) QueryAllMusic
{
    MPMediaQuery *everything = [[MPMediaQuery alloc] init];
    NSLog(@"Logging items from a generic query...");
    NSArray *itemsFromGenericQuery = [everything items];
    NSLog(@"count = %lu", (unsigned long)itemsFromGenericQuery.count);
    for (MPMediaItem *song in itemsFromGenericQuery)
    {
        NSString *songTitle = [song valueForProperty: MPMediaItemPropertyTitle];
        NSString *songArtist = [song valueForProperty:MPMediaItemPropertyArtist];
        NSLog (@"Title:%@, Aritist:%@", songTitle, songArtist);
    }
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
