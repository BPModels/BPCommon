//
//  BPMedioVideoModel.swift
//  BPCommon
//
//  Created by samsha on 2021/8/18.
//

import Foundation

/// 视频资源
public class BPMedioVideoModel: BPMediaModel {

    /// 视频本地地址
    public var videoLocalPath: String?
    /// 视频网络地址
    public var videoRemotePath: String?
    /// 封面截图本地地址
    public var coverPath: String?
    /// 封面截图远端地址
    public var coverUrl: String?
    /// 封面截图尺寸
    public var coverSize: CGSize?
    /// 视频资源对象
    public var data: Data?
    /// 时长
    public var time: TimeInterval = .zero
    
    // MARK: ==== Tools ====
    public func getVideo(progress: CGFloatBlock?, completion: DataBlock?) {
        if let _data = self.data {
            completion?(_data)
        } else {
            if let _path = self.videoLocalPath {
                let url = URL(fileURLWithPath: _path)
                self.data = try? Data(contentsOf: url)
            } else {
                BPDownloadManager.share.video(name: name, urlStr: self.videoRemotePath ?? "", progress: progress) { data in
                    self.data = data
                    completion?(data)
                }
            }
        }
    }
}
