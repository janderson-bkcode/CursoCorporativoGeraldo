﻿using System.Text;
using RabbitMQ.Client;

// Conexão
var factory = new ConnectionFactory { HostName = "localhost" };
using var connection = factory.CreateConnection();
using var channel = connection.CreateModel();

// Criando fila
channel.QueueDeclare(queue: "hello",
                     durable: false,
                     exclusive: false,
                     autoDelete: false,
                     arguments: null);

// Mensagem a ser enviada
var message = "Hello World!";
var body = Encoding.UTF8.GetBytes(message);

//Informando onde será publicado, no caso na fila recem criada acima
channel.BasicPublish(exchange: string.Empty,
                     routingKey: "hello",
                     basicProperties: null,
                     body: body);
Console.WriteLine($" [x] Sent {message}");

Console.WriteLine(" Press [enter] to exit.");
Console.ReadLine();