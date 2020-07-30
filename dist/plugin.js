var capacitorPlugin = (function (exports, core) {
    'use strict';

    var __awaiter = (undefined && undefined.__awaiter) || function (thisArg, _arguments, P, generator) {
        function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
        return new (P || (P = Promise))(function (resolve, reject) {
            function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
            function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
            function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
            step((generator = generator.apply(thisArg, _arguments || [])).next());
        });
    };
    class JwPlayerWeb extends core.WebPlugin {
        constructor() {
            super({
                name: 'JwPlayer',
                platforms: ['web'],
            });
        }
        echo(options) {
            return __awaiter(this, void 0, void 0, function* () {
                console.log('ECHO', options);
                return options;
            });
        }
    }
    const JwPlayer = new JwPlayerWeb();
    core.registerWebPlugin(JwPlayer);

    exports.JwPlayer = JwPlayer;
    exports.JwPlayerWeb = JwPlayerWeb;

    return exports;

}({}, capacitorExports));
//# sourceMappingURL=plugin.js.map
