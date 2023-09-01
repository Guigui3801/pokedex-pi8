import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PokemonModule } from './pokemon/pokemon.module';
import { PokemonTypesModule } from './pokemon-types/pokemon-types.module';

@Module({
  imports: [PokemonModule, PokemonTypesModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
