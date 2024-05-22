# Primeiro, precisamos requerer a gem 'active_support' e suas extensões principais
require 'active_support'
require 'active_support/core_ext'
require_relative 'operacoes_de_tela'
# Extensões para a classe String
class String
  # Usando a extensão de inflections do ActiveSupport para pluralizar e singularizar strings
  def pluralize
    ActiveSupport::Inflector.pluralize(self)
  end

  def singularize
    ActiveSupport::Inflector.singularize(self)
  end

  # Usando a extensão de Time para converter strings em DateTime
  def to_date
    DateTime.parse(self)
  end
end

# Extensões para a classe Array
class Array
  # Usando a extensão de core_ext para somar valores no array
  def sum
    inject(0) { |sum, x| sum + x }
  end

  # Usando a extensão de time para calcular a média dos valores no array
  def average
    return nil if empty?
    sum.to_f / size
  end
end

# Exemplos de uso das novas funcionalidades
limpar_tela
puts ''
# Para String
mensagem_amarela("Exemplo de Extensões String:")
mensagem_amarela("============================")
str = "person"
mensagem(cyan("Singular:") + " #{str}")
mensagem(cyan("Plural:") +  " #{str.pluralize}")
mensagem(cyan("Back to Singular:") + " #{str.pluralize.singularize}")
date_str = "2023-05-22"
mensagem(cyan("Date String:") + " #{date_str}")
mensagem(cyan("Converted to DateTime:") + " #{date_str.to_date}")

puts ''
# Para Array
mensagem_amarela("Exemplo de Extensões de Array:")
mensagem_amarela("============================")
arr = [1, 2, 3, 4, 5]
mensagem(cyan("Array:") + " #{arr.inspect}")
mensagem(cyan("Sum:")  + " #{arr.sum}")
mensagem(cyan("Average:") + " #{arr.average}")


puts ''
puts ''
puts ''
mensagem_verde ("Pressione Enter...")
gets
limpar_tela