7 
I. SELECT p.nroPedido, c.nomeCli
FROM pedido p
INNER JOIN cliente c ON (p.codCli = c.codCli);

No código acima
será apenas apresentanado os numeros dos
pedidos onde há um códigoProduto valido (junção interna)
entre as tabelas Pedido Cliente


SELECT p.nroPedido, c.nomeCli
FROM pedido p
LEFT OUTER JOIN cliente c ON (p.codCli = c.codCli);
Já neste código será apresentado numeros de pedidos 
e cliente onde há pedidos não relacionados a clientes


8
Insert Into ContaCorrente(NroCC,NomeCLiente,saldoCC)
Values(987,'José Oliveira'500)


Select cc.*,lc.* 
from ContaCorrente cc
Inner Join Lancamento lc on (cc.NroCC = lc.NroCC)


9
Select *
from Carro
Where cor = 'azul'
and nroPortas = 4
and ano = 2000 or ano = 2011 