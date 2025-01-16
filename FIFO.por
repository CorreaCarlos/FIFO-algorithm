programa
{
	inclua biblioteca Util
 --> U
 	const inteiro limite = 25				   // constante para representar max de itens na FILA
 	cadeia nome[limite], cabecalho_funcao          // vetor para o nome, titulo cabeçalho tela
	inteiro  quant, registro = 0    			// variavel registro = posição vetor
	caracter opcao
	
	funcao inicio()
	{
		limpa()  // limpa tela
		menu()  // Chama função menu
	}

	funcao menu()
	{
		cabecalho_funcao = "             MENU GERAL                "
		cabecalho()

		escreva("1 - Adicionar Pessoa a Fila de Espera \n")
		U.aguarde(175)  //animação menu
		escreva("2 - Listar Pessoas na Filha de Espera \n")
		U.aguarde(175)  //animação menu
		escreva("3 - Realizar Atendimento \n")
		U.aguarde(175)  //animação menu
		escreva("4 - Retirar todos da fila \n")
		U.aguarde(175)  //animação menu
		escreva("5 - Sair \n")
		U.aguarde(175)  //animação menu

		escreva("---------------------------------------- \n")
		U.aguarde(200)  //animação menu
		escreva("Informe a opção desejada: \n")
		leia(opcao)

		escolha(opcao)
		{
			caso '1':
			{
				fila_atendimento()
				pare
			}
			caso '2':
			{
				listar()
				pare
			}
			caso '3':
			{
				realizar_atendimento()
				pare
			}
			caso '4':
			{
				limpa_fila()
				pare
			}
			caso '5':
			{
				sair()
				pare
			}
			caso contrario:  // Caso escolha opção diferente mostra mensagem de erro e chama função menu denovo
			{
				escreva("Opção inválida! \n")
				U.aguarde(3000)
				menu()
				pare
			}
		}
	}

	funcao fila_atendimento()
	{
		cabecalho_funcao = " ADICIONA PESSOA A FILA DE ATENDIMENTO "
		cabecalho()
		se((limite-registro > 0)) //total de posições - registro = registros disponiveis, se for maior que zero então há espaço!
		{
			cabecalho_funcao = " ADICIONA PESSOA A FILA DE ATENDIMENTO "
			cabecalho()
			escreva("Quantas pessoas entraram na fila de espera?\n")
			leia(quant)
		
			se(quant > 0 e quant <= (limite - registro)) // se a quant for ao menos 1 e igual ou menor ao espaço disponivel
			{
				inteiro contador = 0 // para executar a função de acordo com quant
				enquanto(contador < quant)
				{
					cabecalho_funcao = " ADICIONA PESSOA A FILA DE ATENDIMENTO "
					cabecalho()
					escreva("Informe o nome: \n")
					leia(nome[registro])
					U.aguarde(200)   // aguarda 2 sec
					cabecalho()
					escreva(nome[registro]," Foi adicionado a fila de espera!\n")
					contador ++
					registro ++
					U.aguarde(500)
				}
			}
			senao se(quant == 0)
			{
				cabecalho_funcao = " ADICIONA PESSOA A FILA DE ATENDIMENTO "
				cabecalho()
				escreva("A quantidade inserida é igual a zero!!")
			}
			senao se(quant > (limite-registro))
			{
				cabecalho_funcao = " ADICIONA PESSOA A FILA DE ATENDIMENTO "
				cabecalho()
				escreva("A quantidade inserida excede as vagas disponiveis!\nVagas disponiveis p/ atendimento: ", (limite-registro)," \n")
			}
			senao // mensagem de erro e volta para o menu
			{
			cabecalho_funcao = " ADICIONA PESSOA A FILA DE ATENDIMENTO "
			cabecalho()
			escreva("Atenção: Opção inválida! Tente novamente!\n")
			}
		
		}
		senao
		{
			escreva("O limite de atendimentos p/ o momento foi atingido, aguarde opu volte mais tarde..")
		}
		U.aguarde(1000)
		retorna()
	}

	funcao sair()
	{
		limpa()
		escreva("Finalizando o sistema em 03 segundos. . .")
		U.aguarde(1000) //animação contagem regressiva para fechar sistema

		limpa()
		escreva("Finalizando o sistema em 02 segundos. . .")
		U.aguarde(1000) //animação contagem regressiva para fechar sistema

		limpa()
		escreva("Finalizando o sistema em 01 segundos. . .")
		U.aguarde(1000) //animação contagem regressiva para fechar sistema
	}

	funcao listar()
	
	{
		cabecalho_funcao = "            FILA DE ESPERA              "
		cabecalho()
		se(registro == 0) // se a variavel é igual a 0, significa que nenhum cliente foi cadastrado ainda
		{
			escreva("Não há ninguem na fila\n")
		}
		senao // exibe todos os clientes cadastrados
		{
			escreva("\n")
			para(inteiro i = 0;i < registro; i++)
				{
					escreva((i+1) + ". " + nome[i] + "\n")
				}
		}
		U.aguarde(1000)
		retorna()
	}

	funcao retorna()
	{
		cadeia enter
		escreva("\n"+"Aperte [ENTER] para sair.")
		leia(enter)
		menu()
	}

	funcao cabecalho()
	{
		limpa()
		escreva("========================================= \n")
		U.aguarde(50)  //animação menu
		escreva("|" + cabecalho_funcao + "|\n")
		U.aguarde(50)  //animação menu
		escreva("========================================= \n\n")
		U.aguarde(50)  //animação menu
	}

	funcao realizar_atendimento()
	{
		cabecalho_funcao = "              ATENDIMENTO               "
		cabecalho()
		cadeia confirma
		se(registro == 0) // se a variavel é igual a vazio, significa que não há clientes na fila
		{
			escreva("Não há niguém na fila de espera\n")
		}
		senao
		{
			cabecalho()
			inteiro i = 0
			escreva("Atendimento ",nome[0]," realizado com Sucesso!")
			para(i=0;i<registro-1;i++)
			{
				nome[i] = nome[i+1]
				U.aguarde(200)
			}
			registro--
			nome[registro] = ""
			
		}
		U.aguarde(200)
		retorna()
	}

	funcao limpa_fila()
	{
		limpa()
		se(registro == 0)
		{
			escreva("Não há ninguem na fila de espera...\n")
		}
		senao
		{
			cadeia confirma
			limpa()
			escreva("Você confirma esta ação? [S/N]: ")
			leia(confirma)
			se(confirma == "S")
			{
				cabecalho()
				inteiro i = 0,x = registro
				para(x;x>0;x--)
				{
					para(i=0;i<registro-1;i++)
					{
						nome[i] = nome[i+1]
						U.aguarde(200)
						nome[i+1] = ""
						U.aguarde(200)
					}
					U.aguarde(200)
					registro--
					nome[registro] = ""
				}
				escreva("Todos removidos com Sucesso")
			}
			senao se(confirma == "N")
			{
				escreva("Ação cancelada...\n")
			}
			senao
			{
				escreva("Algo deu errado...Por favor digite somente S ou N.")
				U.aguarde(1000)
				limpa_fila()
			}
			
		}
		U.aguarde(200)
		retorna()
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3658; 
 * @DOBRAMENTO-CODIGO = [9, 15, 73, 129, 144, 165, 173, 184, 211];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {nome, 6, 9, 4}-{registro, 7, 17, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */