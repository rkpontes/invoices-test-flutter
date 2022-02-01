## Caso de sucesso

- Ao criar uma nova fatura, é necessário criar um ID. Cada ID deve ter 2 letras maiúsculas aleatórias seguidas por 4 números aleatórios.
- As faturas podem ser criadas como rascunhos ou como pendentes. Clicar em "Salvar como rascunho" deve permitir que o usuário deixe qualquer campo do formulário em branco, mas deve criar um ID se não existir e definir o status como "rascunho". Clicar em "Salvar e enviar" deve exigir que todos os campos do formulário sejam preenchidos e deve definir o status como "pendente".
- A alteração do campo Payments Terms deve definir a propriedade `paymentDue` com base na data `createdAt` mais os números de dias definidos para as condições de pagamento.
- O `total` deve ser a soma de todos os itens da fatura.
- Editando uma fatura
- Ao salvar as alterações em uma fatura, todos os campos são obrigatórios quando o botão "Salvar alterações" é clicado. Se o usuário clicar em "Cancelar", todas as alterações não salvas devem ser redefinidas.
- Se a fatura que está sendo editada for um "rascunho", o status precisa ser atualizado para "pendente" quando o botão "Salvar alterações" for clicado. Todos os campos são obrigatórios nesta fase.
- Os usuários devem poder marcar as faturas como pagas clicando no botão "Marcar como pago". Isso deve alterar o status da fatura para "pago".
- **Bônus**: Os usuários devem receber um modal de confirmação ao tentar excluir faturas.
- Sinta-se à vontade para não adicionar um estilo personalizado para os campos de formulário de data e dropdown. Os desenhos para esses campos são extras opcionais e são principalmente para fins de ilustração.


## Exceção - aaaaa
- 

## Exceção - bbb