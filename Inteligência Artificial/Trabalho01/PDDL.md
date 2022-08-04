# Planning Domain Definition Language (PDDL)

A Linguagem de Definição de Domínio de Planejamento (PDDL) tem como objetivo estruturar um problema de planejamento 
entre a definição de um domínio (espaço de configuração) e o problema real em si. Ao 
criar uma linguagem de programação (PDDL) destinada a resolver problemas desta natureza e que pudesse ser utilizado 
ferramentas de Inteligência Artificial (IA) para traçar melhores caminho para uma solução, tornaria mais fácil 
comparar desempenhos desses solvers (solucionadores) para determinados tipos de problemas. 

## Exemplo

O problema consiste em uma linha de envase de lubrificantes para motor. A fábrica trabalha com diferentes tipos lubrificantes e o processo de produção envolve uma cadeia de abastecimento em unidades/células robotizadas independentes que realizam operações especificas nas garrafas: rotular, encher, embalar etc. As garrafas são colocadas em paletes e os robôs móveis são programados para pegar e transportar os paletes entre diferentes unidades.  


Existem diferentes tipos de lubrificantes que abastecem as garrafas no início da cadeia de suprimentos. Um palete contém apenas um tipo de lubrificante/garrafa, e cada garrafa passa por uma sequência de operações do início ao fim da cadeia de produção. No início da cadeia, uma unidade é utilizada para armazenar todos os paletes chamada de silo. As unidades podem ter várias entradas denominadas "transportadores" ou "esteiras". Os transportadores e as unidades são específicos para um conjunto de garrafas/lubrificante. As garrafas são admissíveis para transportadores e unidades dependo do tipo de operação. O planejamento automatizado visa otimizar a programação de unidades/robôs e aumentar a eficiência da produção de garrafas de lubrificantes.
