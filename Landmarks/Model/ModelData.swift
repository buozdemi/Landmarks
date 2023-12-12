//
//  ModelData.swift
//  Landmarks
//
//  Created by Burak Özdemir on 12.12.2023.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json") // bir array oluşturduk

func load<T: Decodable>(_ filename: String) -> T { //Decodable swiftte JSON verilerini çözümlemek için kullanılır. _ karakteri, bu parametrenin dışarıdan çağrılırken adının kullanılmayacağını gösterir.
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    // guard belirli bir koşulu kontrol eder if gibi.
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

//func load<T: Decodable>(_ filename: String) -> T {
//func load: Bu ifade, load adında bir fonksiyon tanımlandığını belirtir.
//<T: Decodable>: Bu kısım, fonksiyonun generic (genel) bir yapıya sahip olduğunu gösterir. T bir tür parametresidir ve Decodable protokolünü karşılamalıdır. Decodable protokolü, Swift'te JSON verilerini çözümlemek için kullanılır.
//(_ filename: String): Bu ifade, fonksiyonun bir parametre aldığını belirtir. Parametre adı filename ve tipi String'dir. _ karakteri, bu parametrenin dışarıdan çağrılırken adının kullanılmayacağını gösterir.
//-> T: Bu ifade, fonksiyonun geri dönüş değerini belirtir. T türündedir, yani fonksiyonun geri dönüş değeri belirlenmiş bir türdür.
//let data: Data: Bu satırda, Data türünden bir değişken olan data oluşturuluyor. Bu değişken, dosyadan okunan veriyi depolamak için kullanılacak.
//guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else { fatalError("Couldn't find \(filename) in main bundle.") }: Bu satır, guard ifadesini kullanarak belirli bir koşulu kontrol eder. Eğer belirtilen dosya adı ile uyumlu bir dosya bulunamazsa, fatalError fonksiyonu ile bir hata mesajıyla birlikte uygulama sonlandırılır. Bundle.main.url(forResource: filename, withExtension: nil) ifadesi, ana paket içerisinde belirtilen dosya adı ile uyumlu bir dosyanın URL'sini bulmaya çalışır.
//do { data = try Data(contentsOf: file) } catch { fatalError("Couldn't load \(filename) from main bundle:\n\(error)") }: Bu blok, do-catch yapısı içerisinde yer alır. Burada, Data(contentsOf: file) ifadesi ile dosyadan veriyi yüklemeye çalışırız. Eğer bu işlem başarılı olmazsa (catch bloğu), yine fatalError fonksiyonu kullanılarak bir hata mesajıyla birlikte uygulama sonlandırılır.
//let decoder = JSONDecoder(): Bu satırda, JSON verilerini çözümlemek için kullanılacak bir JSONDecoder örneği oluşturulur.
//return try decoder.decode(T.self, from: data): Bu satırda, oluşturulan JSONDecoder ile data adlı Data objesini, T türüne çözümlemeye çalışırız. T.self ifadesi, T türündeki bir nesneyi temsil eder. Eğer çözümleme başarısız olursa, yine fatalError fonksiyonu kullanılarak bir hata mesajıyla birlikte uygulama sonlandırılır.
