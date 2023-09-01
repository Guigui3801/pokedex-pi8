import { Injectable } from '@nestjs/common';
import { PokemonTypes, Prisma } from '@prisma/client';
import axios from 'axios';
import { PrismaService } from 'src/prisma.service';
import Type from 'src/@types/PokemonType';

@Injectable()
export class PokemonTypesService {
    constructor(private prisma: PrismaService) { }

    async createPokemonTypes(): Promise<Prisma.BatchPayload> {
        const response = await axios.get<Type>(`https://pokeapi.co/api/v2/type`)
        const createMany = await this.prisma.pokemonTypes.createMany({
            data: response.data.results.map((item) => ({
                name: item.name,
                url: item.url
            }),
            )
        })
        return createMany;
    }

    async getPokemonTypes() : Promise<PokemonTypes[]>{
        return this.prisma.pokemonTypes.findMany()
    }


}
