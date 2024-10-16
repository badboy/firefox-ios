// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Common
import XCTest
@testable import Client

final class FakespotUtilsTests: XCTestCase {
    func testIsPadInMultitasking_withIphone() {
        let device = UIUserInterfaceIdiom.phone
        let keyWindow = UIWindow.attachedKeyWindow!
        let subject = FakespotUtils()
        XCTAssertFalse(subject.isPadInMultitasking(device: device, window: keyWindow, viewSize: keyWindow.frame.size),
                       "Should return false for an iPhone")
    }

    func testIsPadInMultitasking_withIpad_fullScreen() {
        let device = UIUserInterfaceIdiom.pad
        let keyWindow = UIWindow.attachedKeyWindow!
        let subject = FakespotUtils()
        XCTAssertFalse(subject.isPadInMultitasking(device: device, window: keyWindow, viewSize: keyWindow.frame.size),
                       "Should return false on iPad in full screen")
    }

    func testIsPadInMultitasking_withIpad_splitScreen() {
        let device = UIUserInterfaceIdiom.pad
        let keyWindow = UIWindow.attachedKeyWindow!
        let subject = FakespotUtils()
        XCTAssertTrue(subject.isPadInMultitasking(device: device, window: keyWindow, viewSize: CGSize.zero),
                      "Should return true on iPad in split screen")
    }

    func testShouldDisplayInSidebar_withIphone() {
        let device = UIUserInterfaceIdiom.phone
        let keyWindow = UIWindow.attachedKeyWindow!
        let subject = FakespotUtils()
        XCTAssertFalse(subject.shouldDisplayInSidebar(device: device, window: keyWindow, viewSize: keyWindow.frame.size),
                       "Should return false for an iPhone")
    }

    func testShouldDisplayInSidebar_withIpad_fullScreen() {
        let device = UIUserInterfaceIdiom.pad
        let keyWindow = UIWindow.attachedKeyWindow!
        let subject = FakespotUtils()
        XCTAssertTrue(subject.shouldDisplayInSidebar(device: device, window: keyWindow, viewSize: keyWindow.frame.size),
                      "Should return true on iPad in full screen")
    }

    func testShouldDisplayInSidebar_withIpad_splitScreen() {
        let device = UIUserInterfaceIdiom.pad
        let keyWindow = UIWindow.attachedKeyWindow!
        let subject = FakespotUtils()
        XCTAssertFalse(subject.shouldDisplayInSidebar(device: device, window: keyWindow, viewSize: CGSize.zero),
                       "Should return false on iPad in split screen")
    }
}
