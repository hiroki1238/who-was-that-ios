//
//  ContentView.swift
//  who-was-that-ios
//
//  Created by Hiroki Taba on 2025/07/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Spacer()
                    .frame(height: 100) // 上部に余白を追加

                Text("トップページ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.cyan)

                Spacer()
                    .frame(height: 50) // ボタンとの間に余白を追加

                VStack(spacing: 20) {
                    NavigationLink(destination: SignUpView()) {
                        Text("新規登録")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: FriendsListView()) {
                        Text("友達リスト")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 40)

                Spacer() // 残りの空間を埋める
            }
            .padding()
        }
    }
}

struct SignUpView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 100) // 上部に余白を追加

            Text("新規登録画面")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.green)

            Spacer() // 残りの空間を埋める
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FriendsListView: View {
    @State private var searchText = ""

    // 仮のデータ
    let friends = Array(repeating: "田場つばき", count: 10)

    var body: some View {
        VStack(spacing: 0) {
            // タイトル
            HStack {
                Text("友達リスト")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 20)

            // 検索ボックス
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("検索", text: $searchText)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 20)

            // 友達リスト
            List {
                ForEach(friends.indices, id: \.self) { index in
                    HStack {
                        // プロフィール画像（仮）
                        Circle()
                            .fill(Color.blue.opacity(0.3))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Text("田")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                            )

                        VStack(alignment: .leading, spacing: 4) {
                            Text(friends[index])
                                .font(.body)
                                .fontWeight(.medium)
                            Text("友達")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        Spacer()
                    }
                    .padding(.vertical, 4)
                }
            }
            .listStyle(PlainListStyle())
            .padding(.top, 10)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

#Preview {
    ContentView()
}
