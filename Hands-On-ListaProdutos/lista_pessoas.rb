require 'terminal-table'
require_relative "operacoes_de_tela"


# Classe Pessoa
class Pessoa
  attr_accessor :nome, :email

  def initialize(nome, email)
    @nome = nome
    @email = email
  end

  def full_informations
    [@nome, @email, "-"]
  end
end

# Classe Funcionario (herda de Pessoa)
class Funcionario < Pessoa

  attr_accessor :cargo

  def initialize(nome, email, cargo)
    super(nome, email)
    @cargo = cargo
  end

  def full_informations
    [@nome, @email, amarelo(@cargo)]
  end
end

# Criação da lista de pessoas
pessoas = [
  Pessoa.new("João", "joao@example.com"),
  Pessoa.new("Maria", "maria@example.com"),
  Funcionario.new("Pedro", "pedro@example.com", "Desenvolvedor"),
  Pessoa.new("Ana", "ana@example.com"),
  Pessoa.new("Luiz", "luiz@example.com"),
  Funcionario.new("Carlos", "carlos@example.com", "Gerente"),
  Pessoa.new("Julia", "julia@example.com"),
  Pessoa.new("Rafael", "rafael@example.com"),
  Funcionario.new("Sandra", "sandra@example.com", "Analista"),
  Pessoa.new("Thiago", "thiago@example.com"),
  Pessoa.new("Leticia", "leticia@example.com")
]
limpar_tela
# Criando a tabela
table = Terminal::Table.new headings: [azul('Nome'), azul('E-mail'), azul('Cargo')], rows: pessoas.map(&:full_informations)
puts table
mensagem_verde('Segue a Lista de Pessoas ...')
gets
limpar_tela
