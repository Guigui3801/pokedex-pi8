import { Controller, Get, Param, Post } from '@nestjs/common';
import { Pokemon } from '@prisma/client';
import { PokemonService } from '../service/pokemon.service';

@Controller('pokemon')
export class PokemonController {
    constructor(private readonly pokemon: PokemonService) { }

    @Get()
    async getAllPokemon(): Promise<Pokemon[]> {
        return this.pokemon.getAllPokemon();
    }

    @Get('/:id')
    async getPokemonById(@Param('id') pokemonId: number): Promise<Pokemon> {
        return this.pokemon.getPokemonById(pokemonId)
    }

    @Get('/db/:id')
    async createPokemonsByDatabase(@Param('id') id: number): Promise<Pokemon> {
        return this.pokemon.createPokemon(id)
    }
    @Post('/all')
    async createAllPokemonsByDatabase(): Promise<Pokemon[]> {
        return this.pokemon.createAllPokemon()
    }

}
