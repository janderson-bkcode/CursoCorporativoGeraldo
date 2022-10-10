namespace ExemplosLP
{
    public abstract class Pessoa
    {
        public string Nome { get; set; }
        public int Idade { get; set; }
        public double Peso { get; set; }
        public int AlturaEmCentimetros { get; set; }

        protected Pessoa() { }

        protected Pessoa(string nome)
        {
            Nome = nome;
        }

        public void Envelhecer()
        {
            Idade += 1;
        }

        public void Engordar()
        {
            Peso += 2;
        }

        public void Crescer(int altura = 5)
        {
            AlturaEmCentimetros += altura;
        }

        public abstract void ImprimirDados();
    }

    public class PessoaFisica : Pessoa
    {
        public string Cpf { get; set; }

        public PessoaFisica(string nome, string cpf) : base(nome)
        {
            Cpf = cpf;
        }

        public void AlterarCpf(string cpf)
        {
            Cpf = cpf;
        }

        public override void ImprimirDados()
        {
            Console.WriteLine($"Nome: {Nome}, Idade: {Idade}, Peso: {Peso}, Aaltura: {AlturaEmCentimetros}, CPF: {Cpf}");
        }
    }

    public class PessoaJuridica : Pessoa
    {
        public string Cnpj { get; set; }

        public PessoaJuridica(string nome, string cnpj) : base(nome)
        {
            Cnpj = cnpj;
        }

        public void AlterarCnpj(string cnpj)
        {
            Cnpj = cnpj;
        }

        public override void ImprimirDados()
        {
            Console.WriteLine($"Nome: {Nome}, Idade: {Idade}, Peso: {Peso}, Aaltura: {AlturaEmCentimetros}, CNPJ: {Cnpj}");
        }
    }
}
