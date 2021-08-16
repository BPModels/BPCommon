//
//  BPDownloadManager.swift
//  BaseProject
//
//  Created by 沙庭宇 on 2020/11/7.
//  Copyright © 2020 沙庭宇. All rights reserved.
//

import Kingfisher
import BPFile

public struct BPDownloadManager {
    public static let share = BPDownloadManager()
    
    ///   下载图片（下载完后会同步缓存到项目）
    /// - Parameters:
    ///   - urlStr: 图片网络地址
    ///   - type: 图片属性
    ///   - progress: 下载进度
    ///   - completion: 下载后的回调
    public func image( urlStr: String, type: BPMediaType, progress: ((CGFloat) ->Void)?, completion: DefaultImageBlock?) {
        guard let url = URL(string: urlStr) else {
            return
        }
        UIImageView().kf.setImage(with: url, placeholder: nil, options: []) { (receivedSize, totalSize) in
            let progressValue = CGFloat(receivedSize)/CGFloat(totalSize)
            progress?(progressValue)
        } completionHandler: { (result: Result<RetrieveImageResult, KingfisherError>) in
            switch result {
            case .success(let imageResult):
                let image = imageResult.image
                completion?(image)
            case .failure(let error):
                BPCommonConfig.share.delegate?.printCommonLog(log:"资源下载失败，地址：\(urlStr), 原因：" + (error.errorDescription ?? ""))
                completion?(nil)
            }
        }
    }
    
    public func video(name: String, urlStr: String, progress: ((CGFloat) ->Void)?, completion: DefaultImageBlock?) {
        
    }
    
    public func audio(name: String, urlStr: String, progress: ((CGFloat) ->Void)?, completion: DefaultImageBlock?) {
        
    }
}
