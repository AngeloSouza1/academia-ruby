def limpar_tela
  if Gem.win_platform?
    system("cls") # No windows
  else
    system("clear") # Em sistemas unix/linux
  end
 end
  def amarelo(msg)
    "\e[33m#{msg}\e[0m"
  end
  def azul(msg)
    "\e[34m#{msg}\e[0m"
  end
def verde(msg)
  "\e[32m#{msg}\e[0m"
end

def mensagem_verde(msg)
  msg =  verde(msg)
  mensagem(msg)
end

def mensagem(msg)
    puts msg

end