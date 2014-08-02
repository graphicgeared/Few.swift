//
//  Button.swift
//  Few
//
//  Created by Josh Abernathy on 8/1/14.
//  Copyright (c) 2014 Josh Abernathy. All rights reserved.
//

import Foundation
import AppKit

public class Button<S: Equatable>: Element<S> {
	private var title: String
	private var frame: CGRect

	private var button: NSButton?

	public init(frame: CGRect, title: String) {
		self.frame = frame
		self.title = title
	}

	public override func applyDiff(other: Element<S>) {
		if !button.getLogicValue() {
			return
		}

		let otherButton = other as Button
		let b = button!
		if title != otherButton.title {
			title = otherButton.title
			b.title = title
		}

		if frame != otherButton.frame {
			frame = otherButton.frame
			b.frame = frame
		}
	}

	public override func realize(parentView: NSView) {
		let button = NSButton(frame: frame)
		button.bezelStyle = .TexturedRoundedBezelStyle
		button.title = title
		self.button = button

		super.realize(parentView)
	}

	public override func getContentView() -> NSView? {
		return button
	}
}