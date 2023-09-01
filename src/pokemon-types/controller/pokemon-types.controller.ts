import { Controller, Get } from '@nestjs/common';
import { PokemonTypesService } from '../service/pokemon-types.service';
import { PokemonTypes, Prisma } from '@prisma/client';

@Controller('pokemon-types')
export class PokemonTypesController {
    constructor(private readonly pokemon: PokemonTypesService) {}

    @Get('/db')
    async createAllPokemonTypes() : Promise<Prisma.BatchPayload> {
        return this.pokemon.createPokemonTypes();
    }

    @Get('/')
    async getAllPokemonTypes() : Promise<PokemonTypes[] | null>{
        return this.pokemon.getPokemonTypes()
    }
    
}
