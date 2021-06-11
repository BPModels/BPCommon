//
//  BPCommonGlobal.swift
//  BPCommon
//
//  Created by samsha on 2021/6/11.
//

import Foundation

// TODO: ==== Block ====

/// 默认闭包
typealias DefaultBlock      = (()->Void)
typealias DefaultImageBlock = ((UIImage?)->Void)
typealias StringBlock       = ((String)->Void)
typealias IntBlock          = ((Int)->Void)
typealias BoolBlock         = ((Bool)->Void)
typealias DoubleBlock       = ((Double?)->Void)


// TODO: ==== Function ====
/// 震动
func shake() {
    let gen = UIImpactFeedbackGenerator(style: .light)
    gen.prepare()
    gen.impactOccurred()
}
