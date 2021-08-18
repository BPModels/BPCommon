//
//  BPImageModel.swift
//  BaseProject
//
//  Created by 沙庭宇 on 2020/10/29.
//  Copyright © 2020 沙庭宇. All rights reserved.
//

import ObjectMapper
import Kingfisher
import Photos
import BPFile


public class BPMediaModel: Mappable, Equatable {
    
    /// 资源ID
    public var id: String = ""
    /// 资源名称
    public var name: String = ""
    /// 聊天室消息ID（仅用于IM）
    public var messageId: String?
    /// 聊天室ID（仅用于IM）
    public var sessionId: String?
    /// 资源类型
    public var type: BPMediaType = .thumbImage
    /// 图片MD5
    public var md5: String?
    /// 文件大小
    public var fileLength: Int = .zero
    
    public init() {}
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map) {
    }
    
    // MARK: ==== Tools ====
    private func queryImageCache(path: String, block: DefaultImageBlock) {
        
    }
    
    public static func == (lhs: BPMediaModel, rhs: BPMediaModel) -> Bool {
        return lhs.id == rhs.id
    }
}

