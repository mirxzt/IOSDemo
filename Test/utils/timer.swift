import Foundation

public typealias TimerBlock = (Int) -> ()
public typealias TimerCompleteBlock = () -> ()

public class Timer {
    var timer: DispatchSourceTimer?
    
    public init() {
        
    }
}

public extension Timer {
    /// 倒计时
    /// - Parameters:
    /// - maxTime: 倒计时时间秒数
    /// - timerBlock: 倒计时进行中回调
    /// - complete: 倒计时结束时回调
    func startTiming(maxTime: Int, timerBlock: @escaping TimerBlock, complete: @escaping TimerCompleteBlock) {
        timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        timer?.schedule(deadline: .now(), repeating: .seconds(1))
        
        // 结束时间
        let endTime = NSDate.init(timeIntervalSinceNow: TimeInterval(maxTime))
        
        timer?.setEventHandler {
            let intinterval = endTime.timeIntervalSinceNow
            
            if intinterval >= 0 {
                DispatchQueue.main.async {
                    timerBlock(Int(intinterval))
                }
                
            } else {
                self.timer?.cancel()
                
                DispatchQueue.main.async {
                    complete()
                }
            }
        }
        timer?.resume()
    }
    
    /// 正向计时
    /// - Parameters:
      /// - startTime: 起始时间 格式为：yyyy-MM-dd HH:mm:ss
      /// - timerBlock: 倒计时回调
    func startPositiveTiming(startTime: String, timerBlock: @escaping TimerBlock) {
        timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        timer?.schedule(deadline: .now(), repeating: .seconds(1))
        
        // 结束时间
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let startDate = format.date(from: startTime)
        
        if startDate == nil {
            return
        }
        
        timer?.setEventHandler {
            let endTime = Date()
            let intinterval = endTime.timeIntervalSince(startDate!)
            
            DispatchQueue.main.async {
                timerBlock(Int(intinterval))
                print("计时为：\(Int(intinterval))，记得调用cancelTiming()方法取消计时")
            }
        }
        timer?.resume()
    }
    
    /// 取消计时
    func cancelTiming() {
        if timer != nil {
            timer!.cancel()
            timer = nil
        }
    }
}
