use PAYMENT

--Seleção cartão pela conta da Bk ou conta do cartão
select 
ac.*,acs.Description 
from AccountCard ac
INNER JOIN AccountCardStatus acs ON(ac.AccountCardStatusId = acs.AccountCardStatusId)
--where IssuerAccountId = 14114
where AccountCardId = 3179
--where ac.AccountCardStatusId = 3
--select * from 
--where AccountCardId = 3005

---Verificando e buscando se o cliente é titular
select c.Name,c.NationalId, cua.Description 
from ClientUserClient cuc
INNER JOIN Client c on(c.ClientId = cuc.ClientId)
INNER JOIN ClientUserAccess cua on(cua.ClientUserAccessId = cuc.ClientUserAccessId)
where cuc.StatusId = 1
ORDER BY cua.ClientUserAccessId;

--Atualizando cartões cancelados para pendentes
--Conforme conta do cartãos
update ac
set ac.AccountCardStatusId = 2
from AccountCard ac
where ac.AccountCardStatusId = 5
and AccountCardId = 3179;


--Selecionando todos os cartoes com status Pendente de geração

select ac.*, acs.Description 
from AccountCard ac
inner join AccountCardStatus acs on(ac.AccountCardStatusId = acs.AccountCardStatusId)
where ac.AccountCardStatusId = 2

--Seleção da conta do cartão pela conta bk
select * from AccountCard
where IssuerAccountId = 14392

-- Selecionando todas as contas da paysmart pendentes de geração 
select ac.*, acs.Description 
from AccountPaysmart ac
inner join AccountPaysmartStatus acs on(ac.AccountPaysmartStatusId = acs.AccountPaysmartStatusId)
where ac.AccountPaysmartStatusId = 2

--//////Projeção de Logs
select * from AccountCardLog
order by datelog desc

--//////Projeção de Logs
select * from AccountLog
order by AccountPaysmartLogId desc 

delete AccountLog
delete AccountCardLog

						
--Atualizando status da conta  para cancelado
update ap
			set ap.AccountPaysmartStatusId = 2
			from AccountPaysmart ap
			where ap.AccountPaysmartStatusId = 1
			And IssuerAccountId = 14392
			And AccountPaysmartId = 2987

select * from AccountPaysmart
where AccountPaysmartStatusId = 2




--Verificar cartões pendentes
select * from AccountCard
where AccountCardStatusId = 3

--Seleção de cartões conforme conta da bk e id da conta cartão
select* from AccountCard
where AccountCardId = 3181
and IssuerAccountId = 14114
--Seleção de cartões conforme conta da bk
select * from AccountPaysmart
where IssuerAccountId = 14392
				
select * from AccountPaysmartStatus -- 1 aprovado,2 Pendente,3 Recusado
							

select * from AccountPaysmart
where AccountPaysmartId = 2982

-- Log de erro ao gerar o cartão porque conta não consta na paysmart
-- Query de verificação do status id com base no id da conta da bk
SELECT *
    FROM AccountPaysmart ap
    INNER JOIN AccountPaysmartStatus aps
    ON(ap.AccountPaysmartStatusId = aps.AccountPaysmartStatusId)
    WHERE ap.IssuerAccountId = 14392;

select * from AccountPaysmart
where IssuerAccountId = 14392

-- atualizar AccountId
update AccountPaysmart
	set AccountId = 14392
	where AccountPaysmartId = 3163

update AccountPaysmart
set AccountPaysmartStatusId = 2
where IssuerAccountId = 14392
	


-- Verificação se o titular é status 1
		SELECT	CardholderType = ac.CardHolderTypeId,
		FullName = SUBSTRING(RTRIM(LTRIM(c.Name)), 0, 30),
		IdentityDocumentNumber = c.NationalId,
		BirthDate = COALESCE(cu.BirthDate, '2000-01-01'),
		Nationality = 'Brasil',
		c.ClientId								
FROM AccountPaysmart ap
LEFT JOIN Account a ON(ap.IssuerAccountId = a.AccountId)
LEFT JOIN Client c ON(a.ClientId = c.ClientId)
LEFT JOIN ClientUserClient cuc ON(c.ClientId = cuc.ClientId)
LEFT JOIN ClientUser cu ON(cuc.ClientId = cu.ClientId)
LEFT JOIN AccountCard ac ON(ap.IssuerAccountId = ac.IssuerAccountId)
WHERE ap.IssuerAccountId = 14392
AND cuc.StatusId = 1
ORDER BY ClientUserClientId;

-- precisar inserir na ClientUserClient quando dá erro na inserção do GetHolderType

insert into ClientUserClient(ClientId,UserId,StatusId,ClientUserAccessId)
Values(23224,26180,1,1)


--Quando dá erro no log de falta de dados do psProductCode que é um dado obrigatório

update AccountPaysmart
	set PsProductCode = '000010'
	--where IssuerAccountId = 14419
	where PsProductCode = 420101
	select * from AccountPaysmart
	where PsProductCode = 00


-- Verificação do produto do design
select * from AccountCard ac
inner join  CardKitDesing ck on(ac.CardKitDesingId = ck.CardKitDesingId)
where AccountCardId = 3181

--Atualizando todos para 1 que é valor 000010 porque o psProductCode da conta da paysmart deve
--ser condizente com o cardKitDesign do AccountCard, nesse caso ,  se é 1 no accountCard tem que ser 000010 na tabela da AccountPaysmart
update AccountCard
	set CardKitDesingId = 1
	where AccountCardId = 3181




select * from AccountPaysmart