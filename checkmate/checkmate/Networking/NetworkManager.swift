//
//  NetworkManager.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/12.
//  Copyright © 2020 강수진. All rights reserved.
//

import Foundation
import Moya

struct NetworkManager: Networkable {
    static let sharedInstance = NetworkManager()
    let provider = MoyaProvider<CheckmateAPI>()
    
    func failureHandle<T>(errorType: NetworkError) -> Result<T, NetworkError> {
        switch errorType {
        case .networkConnectFail:
            return .failure(.networkConnectFail)
        case .networkError(let resCode, let msg):
            return .failure(.networkError((resCode, msg)))
        case .decodeError:
            return .failure(.decodeError)
        }
    }
}

extension NetworkManager {
    func getPlaceList(categoryIdx: Int, completion: @escaping (Result<[Place], NetworkError>) -> Void) {
        fetchData(api: .placeList(categoryIdx: categoryIdx), networkData: PlaceModel.self) { (result) in
            switch result {
            case .success(let successResult):
                completion(.success(successResult.resResult.data))
            case .failure(let errorType):
                completion(self.failureHandle(errorType: errorType))
            }
        }
    }
    func getPlaceDetail(placeIdx: Int, completion: @escaping (Result<PlaceDetail, NetworkError>) -> Void) {
        fetchData(api: .placeDetail(placeIdx: placeIdx), networkData: PlaceDetailModel.self) { (result) in
            switch result {
            case .success(let successResult):
                completion(.success(successResult.resResult.data))
            case .failure(let errorType):
                completion(self.failureHandle(errorType: errorType))
            }
        }
    }
    func addPlace(place: PlaceDetail, completion: @escaping (Result<String, NetworkError>) -> Void) {
        fetchData(api: .addPlace(place: place), networkData: DefaultModel.self) { (result) in
            switch result {
            case .success(let successResult):
                completion(.success(successResult.resResult.message))
            case .failure(let errorType):
                completion(self.failureHandle(errorType: errorType))
            }
        }
    }
    func editPlace(place: PlaceDetail, completion: @escaping (Result<String, NetworkError>) -> Void) {
        fetchData(api: .editPlace(place: place), networkData: DefaultModel.self) { (result) in
            switch result {
            case .success(let successResult):
                completion(.success(successResult.resResult.message))
            case .failure(let errorType):
                completion(self.failureHandle(errorType: errorType))
            }
        }
    }
    func searchPlace(keyword: String, completion: @escaping (Result<[Place], NetworkError>) -> Void) {
        fetchData(api: .searchPlace(keyword: keyword), networkData: PlaceModel.self) { (result) in
            switch result {
            case .success(let successResult):
                completion(.success(successResult.resResult.data))
            case .failure(let errorType):
                completion(self.failureHandle(errorType: errorType))
            }
        }
    }
}
