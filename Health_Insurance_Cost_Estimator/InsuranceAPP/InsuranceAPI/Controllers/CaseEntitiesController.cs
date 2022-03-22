#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using InsuranceAPI.Data;
using InsuranceAPI.Models;

namespace InsuranceAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CaseEntitiesController : ControllerBase
    {
        private readonly DataContext _context;

        public CaseEntitiesController(DataContext context)
        {
            _context = context;
        }

        // GET: api/CaseEntities
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CaseEntity>>> GetcaseEntities()
        {
            return await _context.caseEntities.ToListAsync();
        }

        // GET: api/CaseEntities/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CaseEntity>> GetCaseEntity(int id)
        {
            var caseEntity = await _context.caseEntities.FindAsync(id);

            if (caseEntity == null)
            {
                return NotFound();
            }

            return caseEntity;
        }

        // PUT: api/CaseEntities/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCaseEntity(int id, CaseEntity caseEntity)
        {
            if (id != caseEntity.id)
            {
                return BadRequest();
            }

            _context.Entry(caseEntity).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CaseEntityExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/CaseEntities
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CaseEntity>> PostCaseEntity(CaseEntity caseEntity)
        {
            _context.caseEntities.Add(caseEntity);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCaseEntity", new { id = caseEntity.id }, caseEntity);
        }

        // DELETE: api/CaseEntities/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCaseEntity(int id)
        {
            var caseEntity = await _context.caseEntities.FindAsync(id);
            if (caseEntity == null)
            {
                return NotFound();
            }

            _context.caseEntities.Remove(caseEntity);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CaseEntityExists(int id)
        {
            return _context.caseEntities.Any(e => e.id == id);
        }
    }
}
