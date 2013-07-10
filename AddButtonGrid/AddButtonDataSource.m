//
//  AddButtonDataSource.m
//  AddButtonGrid
//
//  Created by Chris Grant on 20/05/2013.
//  
//  Copyright 2013 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "AddButtonDataSource.h"

@implementation AddButtonDataSource {
    int rowCount;
}

-(id)init {
    if (self = [super init]) {
        rowCount = 1;
    }
    return self;
}

-(NSUInteger)numberOfColsForShinobiGrid:(ShinobiGrid *)grid {
    return 5;
}

-(NSUInteger)shinobiGrid:(ShinobiGrid *)grid numberOfRowsInSection:(int)sectionIndex {
    return rowCount;
}

-(SGridCell*)shinobiGrid:(ShinobiGrid*)grid cellForGridCoord:(const SGridCoord*)gridCoord {
    SGridAutoCell *textCell = [grid dequeueReusableCellWithIdentifier:@"textCell"];
    if(textCell == nil) {
        textCell = [[SGridAutoCell alloc] initWithReuseIdentifier:@"textCell"];
    }
    textCell.textField.text = @"Cell";
    return textCell;
}

-(void)addRow {
    rowCount++;
}

@end