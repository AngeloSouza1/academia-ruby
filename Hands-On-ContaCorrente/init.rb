require 'terminal-table'
require_relative "operacoes_de_tela"

class ContaCorrente
  attr_accessor :saldo

  def initialize(saldo_inicial)
    @saldo = saldo_inicial
  end

  def depositar(valor)
    @saldo += valor
    puts "Depósito de #{azul(valor)} realizado com sucesso. Novo saldo: #{verde(@saldo)}"
  end

  def sacar(valor)
    if valor <= @saldo
      @saldo -= valor
      puts "Saque de #{azul(valor)} realizado com sucesso. Novo saldo: #{verde(@saldo)}"
    else
      puts "Saldo insuficiente para sacar #{azul(valor)}. Saldo atual: #{vermelho(@saldo)}"
    end
  end
end

limpar_tela
puts ''
mensagem_amarela '============= EXEMPLO DE USO ================='
puts ''
conta = ContaCorrente.new(1000)
conta.depositar(500)
conta.sacar(300)
conta.sacar(800)
conta.sacar(500)
puts ''
mensagem_amarela '============= DEMONSTRATIVO =================='
# Criando a tabela
puts ''
table = Terminal::Table.new do |t|
  t.headings = [azul('Ação'), azul('Valor'), azul('Saldo')]
  t.add_row ['Saldo Inicial', '-', 1000]
  t.add_row ['Depósito', azul(500), verde(1500)]
  t.add_row ['Saque', azul(300), verde(1200)]
  t.add_row ['Saque (Saldo Insuficiente)', azul(800), verde(400)]
  t.add_row ['Saque (Saldo Insuficiente)', azul(500), vermelho(400)]
end

puts table
mensagem_verde "Enter para sair ..."
gets
limpar_tela
