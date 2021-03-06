//
//  EditorState.swift
//  Collider
//
//  Created by Max Desiatov on 10/01/2021.
//

import ComposableArchitecture
import SwiftLSPClient

struct EditorState: Equatable {
  let tabs: IdentifiedArrayOf<EditorTabState>
  var currentTab: EditorTabState.ID
}

extension EditorState {
  init(_ fileItem: FileItem?) {
    // FIXME: check if `fileItem` is a directory
    let tab = EditorTabState(fileItem)
    tabs = .init([tab])
    currentTab = tab.id
  }
}

enum EditorAction {
  case save
  case hover(Position)
  case closeTab(EditorTabState.ID)
}
