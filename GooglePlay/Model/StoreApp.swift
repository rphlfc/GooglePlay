//
//  App.swift
//  GooglePlay
//
//  Created by Raphael Cerqueira on 06/08/21.
//

import SwiftUI

struct StoreApp: Identifiable {
    let id = UUID().uuidString
    let icon: String
    let name: String
    let publisher: String
    let description: String
}

let apps = [
    StoreApp(icon: "item0", name: "TikTok", publisher: "TikTok Pte. Ltd.", description: "TikTok is THE destination for mobile videos. On TikTok, short-form videos are exciting, spontaneous, and genuine. Whether you’re a sports fanatic, a pet enthusiast, or just looking for a laugh, there’s something for everyone on TikTok. All you have to do is watch, engage with what you like, skip what you don’t, and you’ll find an endless stream of short videos that feel personalized just for you. From your morning coffee to your afternoon errands, TikTok has the videos that are guaranteed to make your day.\n\nWe make it easy for you to discover and create your own original videos by providing easy-to-use tools to view and capture your daily moments. Take your videos to the next level with special effects, filters, music, and more."),
    
    StoreApp(icon: "item1", name: "iFood Delivery de Comida", publisher: "iFood Delivery de Comida", description: "Baixe o app e peça sua comida no iFood. Aqui você tem listas com milhares de opções e entrega grátis pra aproveitar. Com nosso delivery, você pede pratos dos melhores restaurantes ou faz suas compras online com o delivery de mercado!\n\nDelivery de comida online pra todos os tipos de fome: arroz com feijão, esfiha, doce, lanches, hambúrguer, salada, pizza, sushi, yakisoba, açaí e muito mais. Faça seu pedido nos melhores restaurantes e aproveite sua entrega onde estiver!"),
    
    StoreApp(icon: "item2", name: "Uber - Peça uma viagem", publisher: "Uber Technologies, Inc", description: "Na Uber, estamos comprometidos com o seu bem-estar. Criamos um padrão de segurança em que você pode confiar, pois se locomover com tranquilidade é um direito seu.\n\nÉ muito simples pedir viagens pelo app da Uber. Basta abrir o app, digitar seu destino e pronto: um motorista parceiro por perto levará você até lá com segurança.\n\nSaia de praticamente qualquer lugar e chegue aonde quiser\n\nDisponível em mais de 600 aeroportos e 10.000 cidades em todo o mundo, a Uber ajuda você a viajar sem estresse. Solicite sua viagem quando precisar ou agende com antecedência."),
    
    StoreApp(icon: "item3", name: "Nubank: Conta, Cartão de crédito e muito mais", publisher: "Nu", description: "O Nubank nasceu para acabar com a complexidade dos bancos tradicionais e devolver o controle da vida financeira nas mãos de cada um.\n\nSomos a maior empresa de tecnologia em serviços financeiros da américa latina.\n\nE é por isso que nosso aplicativo foi criado para refletir tudo no que acreditamos.\n\nCom ele, você tem uma experiência transparente, simples e justa.\n\nComo sempre deveria ser."),
    
    StoreApp(icon: "item4", name: "PicPay: Pagamentos, Transferências, Pix e conta", publisher: "PicPay", description: "Com o PicPay você pode:\n- Receber e enviar dinheiro para outras pessoas, sem taxas.\n- Com a sua Conta Digital grátis , seu dinheiro fica seguro e rende mais que a poupança!\n- Pagar contas e parcelar boletos em até 12x.\n- Ganhar cashback (dinheiro de volta) em diversas compras, direto no saldo da sua Conta Digital grátis.\n- Recarregar o celular de qualquer lugar;\n- Recarregar o seu cartão de transporte pelo app, evitando filas e agilizando o seu dia a dia (Válido para São Paulo, Ribeirão Preto, Diadema, Taubaté, Sorocaba, Rio de Janeiro e Pelotas);\n- Comprar créditos para games online;\n- Comprar crédito online para os seus serviços digitais favoritos, como Uber e Ifood, usando o saldo da sua Conta Digital.\n- Comprar créditos da sua operadora de TV por assinatura ou serviço de streaming;\n- Fazer pagamentos nos milhares de estabelecimentos que usam o PicPay Empresas ou via QR Code nas maquininhas Cielo, Rede e Getnet;"),
    
    StoreApp(icon: "item5", name: "Kwai - Assista, Crie e Compartilhe Vídeos", publisher: "KWAI", description: "O Kwai é uma rede social para criar e compartilhar vídeos curtos. Você se conecta com amigos e pessoas de todos os cantos do Brasil que se divertem descobrindo tendências e compartilhando momentos. A nossa comunidade se comunica produzindo vídeos mostrando o seu dia a dia, participando de desafios e se divertindo com os melhores memes da rede. Tudo pode ser feito de jeito simples, com dezenas de possibilidades de filtros para que ninguém passe despercebido.")
]
