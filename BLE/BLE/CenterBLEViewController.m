//
//  CenterBLEViewController.m
//  BLE
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "CenterBLEViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
@interface CenterBLEViewController ()<CBCentralManagerDelegate,CBPeripheralDelegate>
@property(nonatomic,strong)CBCentralManager *cbManager;
@property(nonatomic,strong)CBPeripheral *peripheral;
@end

@implementation CenterBLEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    if (self.cbManager.state == ) {
//        <#statements#>
//    }
    
    // Do any additional setup after loading the view.
}

-(CBCentralManager *)cbManager
{
    if (!_cbManager) {
        _cbManager = [[CBCentralManager alloc]initWithDelegate:self queue:(dispatch_get_main_queue()) options:nil];
    }
    return _cbManager;
}

#pragma mark CBCentralManagerDelegate
//中心管理者被初始化，会触发该方法
-(void)centralManagerDidUpdateState:(CBCentralManager *)central
{/*
  CBCentralManagerStateUnknown = CBManagerStateUnknown,
  CBCentralManagerStateResetting = CBManagerStateResetting,
  CBCentralManagerStateUnsupported = CBManagerStateUnsupported,
  CBCentralManagerStateUnauthorized = CBManagerStateUnauthorized,
  CBCentralManagerStatePoweredOff = CBManagerStatePoweredOff,
  CBCentralManagerStatePoweredOn = CBManagerStatePoweredOn,
  */
    switch (central.state) {
        case CBCentralManagerStateUnknown:
            NSLog(@"CBCentralManagerStateUnknown");
            break;
        case CBCentralManagerStateResetting:
            NSLog(@"CBCentralManagerStateResetting");
            break;
        case CBCentralManagerStateUnsupported:
            NSLog(@"CBCentralManagerStateUnsupported");

            break;
        case CBCentralManagerStateUnauthorized:
            NSLog(@"CBCentralManagerStateUnauthorized");

            break;
        case CBCentralManagerStatePoweredOff:
            NSLog(@"CBCentralManagerStatePoweredOff");

            break;
        case CBCentralManagerStatePoweredOn:
            NSLog(@"CBCentralManagerStatePoweredOn");
            //在设备管理者成功开启后再进行一些操作
            //通过某些服务和设置 扫描外设
            [self.cbManager scanForPeripheralsWithServices:nil options:nil];
            //搜索成功后调用找到外设的方法
            break;
        default:
            break;
    }
}


/**
 发现外设回调

 @param central 中心设备
 @param peripheral 外设
 @param advertisementData 广播数据
 @param RSSI 信号强度
 */
-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI
{
    //设置过滤规则条件
    if([peripheral.name hasPrefix:@"foo"]&&RSSI.unsignedIntegerValue>40){
        self.peripheral = peripheral;
        //链接外设
        [self.cbManager connectPeripheral:self.peripheral options:nil];
    }
}

/**
 外设链接成功回调

 @param central 中心链接
 @param peripheral 外设
 */
-(void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    self.peripheral.delegate =self;
    //Services 服务ID数组，nil 支持所有服务
    //    触发- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(nullable NSError *)error

    [self.peripheral discoverServices:nil];
}

/**
 外设链接失败回调

 @param central 中心链接
 @param peripheral 外设
 @param error 错误
 */
-(void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    
}

/**
 丢失链接回调

 @param central 中心链接
 @param peripheral 外设
 @param error 错误码
 */
-(void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    
}
#pragma mark CBPeripheralDelegate

/**
 发现外设的服务后调用的方法

 @param peripheral 外设
 @param error 错误
 */
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(nullable NSError *)error
{
    if (error) {
        NSLog(@"error is %@",error.localizedDescription);
        return;
    }
    for (CBService *service in peripheral.services) {
//        发现服务后，让设备再去发现服务内部的特征们
        [self.peripheral discoverCharacteristics:nil forService:service];
    }
}
//发现外设服务里的特征时调用的代理方法
-(void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    if (error) {
        return;
    }
    //遍历所有服务特征
    for (CBCharacteristic *cha in service.characteristics) {
        //获取特征对应的描述
        [peripheral discoverDescriptorsForCharacteristic:cha];
        //获取特征的值
        [peripheral readValueForCharacteristic:cha];
    }
}

//更新外设特征的value的时候会调用
-(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForDescriptor:(CBDescriptor *)descriptor error:(NSError *)error {
    [peripheral readValueForDescriptor:descriptor];
}

//更新特征的描述的值的时候会调用
-(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    
    for (CBDescriptor *descriptor in characteristic.descriptors) {
        //会触发 didDiscoverDescriptorsForCharacteristic
        [peripheral readValueForDescriptor:descriptor];
    }
}
-(void)peripheral:(CBPeripheral *)peripheral didDiscoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    
}
#pragma mark 自定义方法
//外设 写入数据到特征中
-(void)king_peripheral:(CBPeripheral *)peripheral didWriteData:(NSData *)data forCharacteristic:(CBCharacteristic *)characteristic{
    /*
     CBCharacteristicPropertyBroadcast                                                = 0x01,
     CBCharacteristicPropertyRead                                                    = 0x02,
     CBCharacteristicPropertyWriteWithoutResponse                                    = 0x04,
     CBCharacteristicPropertyWrite                                                    = 0x08,
     CBCharacteristicPropertyNotify                                                    = 0x10,
     CBCharacteristicPropertyIndicate                                                = 0x20,
     CBCharacteristicPropertyAuthenticatedSignedWrites                                = 0x40,
     CBCharacteristicPropertyExtendedProperties                                        = 0x80,
     CBCharacteristicPropertyNotifyEncryptionRequired NS_ENUM_AVAILABLE(10_9, 6_0)    = 0x100,
     CBCharacteristicPropertyIndicateEncryptionRequired NS_ENUM_AVAILABLE(10_9, 6_0)    = 0x200
     */
    //由于枚举属性是NS_OPTIONS 所以一个枚举可能对应多个类型 不能用= 判断 而用包含&
    //判断是否可写
    if (characteristic.properties & CBCharacteristicPropertyWrite) {
        //写入的数据
        [peripheral writeValue:data forCharacteristic:characteristic type:CBCharacteristicWriteWithResponse];//通过此响应记录查看是否成功写入
    }
    
    
    
}
//通知订阅 and 取消订阅
-(void)king_regNotifyWithPeripheral:(CBPeripheral *)peripheral andCharacteristic:(CBCharacteristic *)characteristic{
    //外设为特征订阅的通知 数据会进入 peripheral:didUpdateValueForCharacteristic:error
    [peripheral setNotifyValue:YES forCharacteristic:characteristic];
    
}
-(void)king_CancelRegNotifyWithPeripheral:(CBPeripheral *)peripheral andCharacteristic:(CBCharacteristic *)characteristic{
    //取消外设为特征订阅的通知 数据会进入 peripheral:didUpdateValueForCharacteristic:error
    [peripheral setNotifyValue:NO forCharacteristic:characteristic];
}
//断开链接
-(void)king_dismissConentedWithPeripheral:(CBPeripheral *)peripheral{
    //停止扫描
    [self.cbManager stopScan];
    [self.cbManager cancelPeripheralConnection:peripheral];
}




@end
