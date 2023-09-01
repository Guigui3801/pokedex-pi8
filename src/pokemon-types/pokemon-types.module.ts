import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { PokemonTypesService } from './service/pokemon-types.service';
import { PokemonTypesController } from './controller/pokemon-types.controller';


@Module({
    providers: [PokemonTypesService, PrismaService],
    controllers: [PokemonTypesController]
  })
export class PokemonTypesModule {}
