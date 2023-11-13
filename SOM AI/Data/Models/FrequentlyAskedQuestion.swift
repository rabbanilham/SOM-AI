//
//  FrequentlyAskedQuestion.swift
//  SOM AI
//
//  Created by Bagas Ilham on 10/11/2023.
//

import Foundation

struct FrequentlyAskedQuestion: Codable {
    let question: String?
    let answer: String?
    
    static func defaultFaqs() -> [FrequentlyAskedQuestion] {
        return [
            FrequentlyAskedQuestion(question: "Gimana cara pakai SOM AI?", answer: "Lo tinggal daftar pakai email atau akun Google, trus langsung chat sama SOM AI deh. Lo bisa chat gratis 5 kali loh."),
            FrequentlyAskedQuestion(question: "Kenapa SOM AI berbayar?", answer: "Supaya SOM AI bisa dipakai oleh sebanyak-banyaknya mahasiswa/siswa di seluruh Indonesia. Oleh karena itu kami butuh bantuan lo untuk bersama-sama mendukung biaya operasional SOM AI dengan berlangganan SOM AI."),
            FrequentlyAskedQuestion(question: "Kalau periode langganannya sudah habis, apakah bisa diperpanjang?", answer: "Bisa banget. Lo tinggal berlangganan kembali untuk periode selanjutnya."),
            FrequentlyAskedQuestion(question: "Apakah percakapan SOM AI bisa tersimpan?", answer: "Tentunya bisa. Seluruh percakapan lo bareng SOM AI yang sudah berlalu akan otomatis tersimpan di akun lo."),
            FrequentlyAskedQuestion(question: "Apakah SOM AI hanya untuk mahasiswa skripsian?", answer: "Engga dong. Lo bisa pakai SOM AI buat bantuin ngerjain tugas sekolah atau kuliah lo setiap hari."),
            FrequentlyAskedQuestion(question: "Gimana cara mendapatkan jawaban terbaik dari SOM AI?", answer: "Lo bisa menulis pertanyaan dengan lengkap berdasarkan konteks yang mau lo tanyakan. Contoh “Tolong tuliskan ide judul penelitian di bidang Ilmu Komputer yang gampang”."),
            FrequentlyAskedQuestion(question: "Apakah sumber artikel ilmiah yang diberikan oleh SOM AI 100% akurat?", answer: "Belum tentu, lo sebaiknya cek ulang artikel ilmiah yang diberikan oleh SOM AI.")
        ]
    }
}
