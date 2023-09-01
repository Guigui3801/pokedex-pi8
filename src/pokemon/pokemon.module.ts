import { Module } from '@nestjs/common';
import { PokemonService } from './service/pokemon.service';
import { PokemonController } from './controller/pokemon.controller';
import { PrismaService } from 'src/prisma.service';

@Module({
  providers: [PokemonService, PrismaService],
  controllers: [PokemonController]
})
export class PokemonModule {}
