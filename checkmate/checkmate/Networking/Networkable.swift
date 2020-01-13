//
//  Networkable.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/12.
//  Copyright © 2020 강수진. All rights reserved.
//

import Moya
import SwiftyJSON

protocol Networkable {
    var provider: MoyaProvider<CheckmateAPI> { get }
    func getPlaceList(categoryIdx: Int, completion: @escaping (Result<[Place], NetworkError>) -> Void)
    func getPlaceDetail(placeIdx: Int, completion: @escaping (Result<PlaceDetail, NetworkError>) -> Void)
    func addPlace(place: PlaceDetail, completion: @escaping (Result<String, NetworkError>) -> Void)
    func editPlace(place: PlaceDetail, completion: @escaping (Result<String, NetworkError>) -> Void)
    func searchPlace(keyword: String, completion: @escaping (Result<[Place], NetworkError>) -> Void)
    func searchAddress(keyword: String, completion: @escaping (Result<[Juso], NetworkError>) -> Void)
}

extension Networkable {
    func fetchData<T: Codable>(api: CheckmateAPI, networkData: T.Type, completion: @escaping (Result<(resCode: Int, resResult: T), NetworkError>) -> Void) {
        provider.request(api) { (result) in
            switch result {
            case let .success(res) :
                do {
                    print(JSON(res.data))
                    let resCode = res.statusCode
                    let data = try JSONDecoder().decode(T.self, from: res.data)
                    completion(.success((resCode, data)))
                } catch {
                    completion(.failure(.decodeError))
                }
            case let .failure(err) :
                let statusCode = err.response?.statusCode ?? 0
                if statusCode == -1009 {
                    completion(.failure(.networkConnectFail))
                } else {
                    completion(.failure(.networkError((statusCode, err.localizedDescription))))
                }
            }
        }
    }
}
