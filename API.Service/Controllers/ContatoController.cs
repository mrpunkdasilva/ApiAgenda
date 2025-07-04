using API.DataAccess;
using API.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.CompilerServices;

namespace API.Service.Controllers
{
    [ApiController]
    public class ContatoController : ControllerBase
    {
        private readonly ILogger<ContatoController> _logger;
        ContatoRepositorio contatoRepositorio;

        public ContatoController(ILogger<ContatoController> logger)
        {
            var builder = new ConfigurationBuilder()
                        .SetBasePath(Directory.GetCurrentDirectory())
                        .AddJsonFile("appSettings.json", optional: true, reloadOnChange: true);
            IConfiguration _configuration = builder.Build();
            var connString = _configuration.GetConnectionString("BDService");

            contatoRepositorio = new ContatoRepositorio(connString);

            _logger = logger;
        }
        
        [HttpGet]
        [Route("health")]
        public IActionResult HealthCheck()
        {
            return Ok(new { status = "healthy", timestamp = DateTime.UtcNow });
        }

        [HttpGet]
        [Route("contatos")]
        public List<Contato> Get()
        {
            return contatoRepositorio.GetAll();
        }

        [HttpGet]
        [Route("contatosid")]
        public Contato GetById(int id)
        {
            return contatoRepositorio.Get(id);
        }


        [HttpGet]
        [Route("contatoscelular")]
        public Contato GetByCelular(string celular)
        {
            return contatoRepositorio.GetContatoPorCelular(celular);
        }
        
        [HttpGet]
        [Route("contatosnome")]
        public Contato GetByNome(string nome)
        {
            return contatoRepositorio.GetContatoPorNome(nome);
        }
        
        [HttpGet]
        [Route("contatosnomeexato")]
        public Contato GetByNomeExato(string nome)
        {
            return contatoRepositorio.GetContatoPorNomeExato(nome);
        }


        [HttpPut]
        [Route("inserircontato")]
        public string InserirContato(Contato contato)
        {
            int result = contatoRepositorio.Insert(contato);
            if (result == 0) return "erro ao inserir dados";
            else return "Contato inserido com sucesso!!!";
        }


        [HttpPatch]
        [Route("atualizarcontato")]
        public string AtualizarContato(Contato contato)
        {
            int result = contatoRepositorio.Update(contato);
            if (result == 0) return "Erro ao atualizar dados";
            else return "Contato atualizado com sucesso!!!";
        }


        [HttpDelete]
        [Route("excluircontato")]
        public string ExcluirContato(int id)
        {
            int result = contatoRepositorio.Delete(id);
            if (result == 0) return "Erro ao excluir contato!!";
            else return "Contato excluido com sucesso!!!";
        }
    }
}
