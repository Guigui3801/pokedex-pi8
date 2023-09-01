import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { Pokemon } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';
import axios, { AxiosResponse } from 'axios'
import PokemonProps from 'src/@types/Pokemon';

@Injectable()
export class PokemonService {
  constructor(private prisma: PrismaService) { }

  async getAllPokemon(): Promise<Pokemon[] | null> {
    return this.prisma.pokemon.findMany({
      include: {
        types: true
      }
    });
  }

  async getPokemonById(pokemonId: number): Promise<Pokemon | null> {
    try {
      return await this.prisma.pokemon.findFirstOrThrow({
        where: {
          id: Number(pokemonId)
        },
        include: {
          types: {
            select: {
              name: true
            }
          }
        }
      })
    } catch (error) {
      throw new HttpException({
        status: HttpStatus.NOT_FOUND,
        error: 'Pokemon não encontrado',
      }, HttpStatus.NOT_FOUND, {
        cause: error
      });
    }
  }

  async createPokemon(id: number): Promise<Pokemon> {
    const response = await axios.get<PokemonProps>(`https://pokeapi.co/api/v2/pokemon/${id}`)
    return this.prisma.pokemon.create({
      data: {
        name: response.data.name,
        id: response.data.id,
        sprite: response.data.sprites.other['official-artwork'].front_default,
        types: {
          connect: response.data.types.map((item) => ({
            name: item.type.name,
          })),
        }
      },
      include: {
        types: true
      }
    })
  }
  async createAllPokemon(): Promise<Pokemon[]> {
    const endpoints = [];
    for (let i = 1; i < 151; i++) {
      endpoints.push(`https://pokeapi.co/api/v2/pokemon/${i}/`);
    }
    const response = await axios.all<AxiosResponse<PokemonProps>>(endpoints.map((endpoint) => axios.get<PokemonProps>(endpoint)));

    return await this.prisma.$transaction(
      response.map((item) => this.prisma.pokemon.create({
        data: {
          id: item.data.id,
          name: item.data.name,
          sprite: item.data.sprites.other['official-artwork'].front_default,
          types: {
            connect: item.data.types.map((item) => ({
              name: item.type.name,
            })),
          }
        }
      }
      ))
    )
  }
}
