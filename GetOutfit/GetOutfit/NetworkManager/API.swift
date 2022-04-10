//
//  API.swift
//  GetOutfit
//
//  Created by Ahtem Sitjalilov on 04.04.2022.
//

import Foundation


// TODO: - Пересмотреть, не понравилась реализация фильтра
enum API: UrlPath {
    static private var limit = 50
    
    case categories(filter: Categories?, limit: Int? = limit)
    case items(filter: Items?, limit: Int? = limit, ids: [Int] = [])
    case occasions(filter: Occasion?, limit: Int? = limit)
    case onboarding(filter: Onboarding?, limit: Int? = limit)
    case server(filter: Server?, limit: Int? = limit)
    
    func request<T: Codable>(completion: @escaping ([T]?) -> Void) {
        var parameters: [String: String] = [:]
        
        switch self {
        case .categories(let filter, let limit):
            typealias f = Categories.CodingKeys
            parameters[f.id.str] ?= "in.(%@)".format(filter?.id)
            parameters[f.name.str] ?= "like.*%@*".format(filter?.name)
            parameters["limit"] ?= "%@".format(limit)
        case .items(let filter, let limit, let ids):
            typealias f = Items.CodingKeys
            parameters[f.id.str] ?= "in.(%@)".format(array: ids)
            parameters[f.name.str] ?= "like.*%@*".format(filter?.name)
            parameters[f.gender.str] ?= "in.(%@)".format(filter?.gender)
            parameters[f.size.str] ?= "like.*%@*".format(filter?.size)
            parameters[f.color.str] ?= "like.*%@*".format(filter?.color)
            parameters["limit"] ?= "%@".format(limit)
        case .occasions(let filter, let limit):
            typealias f = Occasion.CodingKeys
            parameters[f.id.str] ?= "in.(%@)".format(filter?.id)
            parameters[f.name.str] ?= "like.*%@*".format(filter?.name)
            parameters[f.label.str] ?= "like.*%@*".format(filter?.label)
            parameters["limit"] ?= "%@".format(limit)
        case .onboarding(let filter, let limit):
            typealias f = Onboarding.CodingKeys
            parameters[f.title.str] ?= "like.*%@*".format(filter?.title)
            parameters["limit"] ?= "%@".format(limit)
        case .server(let filter, let limit):
            typealias f = Server.CodingKeys
            parameters[f.server.str] ?= "like.*%@*".format(filter?.server)
            parameters["limit"] ?= "%@".format(limit)
        }
        
        var urlContainer = URLComponents(string: AppConfig.basicUrl)
        urlContainer?.scheme = "http"
        urlContainer?.path = self.asUrlPath
        urlContainer?.queryItems = []
        parameters.forEach { key, value in
            let query = URLQueryItem(name: key, value: value)
            urlContainer?.queryItems?.append(query)
        }

        guard let url = urlContainer?.url
        else { completion(nil); return }
        
        print("myLog: url",url)
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                
               let decoder = JSONDecoder()
                do {
                    let rawResponse = try decoder.decode([T].self, from: data)
                    completion(rawResponse)
                    return
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        task.resume()
    }
}

enum Site: String {
    case malequizua
    case femalequizua
}
