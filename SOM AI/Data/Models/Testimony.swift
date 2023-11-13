//
//  Testimony.swift
//  SOM AI
//
//  Created by Bagas Ilham on 09/11/2023.
//

import Foundation

struct Testimony: Codable {
    let authorName: String?
    let testimonyMessage: String?
    
    static func defaultTestimonies() -> [Testimony] {
        return [
            Testimony(authorName: "Ghea", testimonyMessage: "“Menggunakan SOM AI sangat membantu mempersingkat waktu penelitian karena tidak perlu terlalu banyak mencari referensi dan mensortirnya seperti menggunakan search engine lain.”"),
            Testimony(authorName: "Andini", testimonyMessage: "“Sangat terbantu, terkadang stuck dengan apa yang hendak ditulis. SOM AI sangat membantu memberikan wawasan dan inspirasi untuk menulis.”"),
            Testimony(authorName: "Anggi", testimonyMessage: "“Dengan SOM AI saya dapat memecahkan beberapa pertanyaan yang membutuhkan jawaban profesional tanpa harus menunggu balasan chat dosen.”"),
            Testimony(authorName: "Tiara", testimonyMessage: "“Beban tugas terasa ringan. Dapat ilmu tambahan walaupun gak bertatap muka langsung. Terima kasih SOM AI”"),
            Testimony(authorName: "Eka", testimonyMessage: "“Jadi dapat semacam “ilham” untuk mencari bagian dalam penelitian yang masih kurang. Jadi lebih ada teman ngobrol soal skripsi. Jadi ada teman yang bisa ditanya dan memastikan sebuah pengetahuan yang saya punya itu benar/tidak.”"),
            Testimony(authorName: "Jheniar", testimonyMessage: "“Mendapatkan gambaran maupun pandangan terkait dengan judul-judul skripsi, sehingga membuat saya mudah dalam memulai membaca dan mencari jurnal-jurnal terkait untuk dipelajari sebelum semester akhir”")
        ]
    }
}
